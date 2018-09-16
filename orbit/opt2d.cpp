#include <fstream>
#include <iomanip>
#include <iostream>

#include "config.h"
#include "units.h"

#include "ship.h"
#include "simulator.h"

#include <util/getarg.h>

#include <nlopt.h>

using math::vect3d;
using math::scalar;

std::ostream &operator<< (std::ostream &os, scalar s)
{
    return os << double(s);
}

std::ostream &operator<< (std::ostream &os, vect3d v)
{
    return os << v.x () << " " << v.y (); // << " " << v.z ();
}

units unit;

double planet_radius;

struct optimizer {
    struct params {
        double m0;
        double r0;
        double v0;

        double rf;

        double thrust;
        double mass_rate;
    };

    struct opt_params {
        static const int size = 5;
        double tab[size];

        opt_params () { tab[0] = 0. / 0.; }
        opt_params (const double *t) { *this = t; }

        opt_params &operator= (const double *t)
        {
            for (int i = 0; i < size; ++i) tab[i] = t[i];
            return *this;
        }

        bool operator!= (const double *other)
        {
            for (int i = 0; i < size; ++i)
                if (tab[i] != other[i]) return true;
            return false;
        }

        double tf () const { return tab[0]; }
        double pr0x () const { return tab[1]; }
        double pr0y () const { return tab[2]; }
        double pv0x () const { return tab[3]; }
        double pv0y () const { return tab[4]; }

        double &tf () { return tab[0]; }
        double &pr0x () { return tab[1]; }
        double &pr0y () { return tab[2]; }
        double &pv0x () { return tab[3]; }
        double &pv0y () { return tab[4]; }
    };

    params p;
    simulator<vship> sim;
    long max_iterations = 10000;

    opt_params last_opt;
    typedef simulator<vship>::state state;
    state last_state;
    nlopt_opt opt;
    long num_eval = 0;

    vship::state y_ap0;
    scalar pv_mid0;
    vship::state y_mid;
    scalar r_min;
    scalar r_dot_v_min;
    double epsilon;

    optimizer (const optimizer &) = delete;
    optimizer (optimizer &&)      = delete;
    optimizer &operator= (const optimizer &) = delete;
    optimizer &operator= (optimizer &&) = delete;

    optimizer (const params &p, double sim_tol = 1e-8)
        : p{p}
        , sim{vship{ship::deriv{p.thrust, p.mass_rate}, ship::error{sim_tol}}}
    {
        opt = nlopt_create (NLOPT_LN_COBYLA, opt_params::size);
        // std::cerr << "nlopt algo "
        // << nlopt_algorithm_name (nlopt_get_algorithm (opt)) << "\n";

        // nlopt_set_max_objective (opt, mass, this);
        nlopt_set_min_objective (opt, total_dv, this);
        nlopt_set_ftol_abs (opt, 1e-7);
        // std::cout << "nlopt_get_xtol_rel " << nlopt_get_xtol_rel (opt) <<
        // "\n";
        // std::cout << "nlopt_get_xtol_abs " << nlopt_get_xtol_abs (opt) <<
        // "\n";
        // double xtol[opt_params::size] = {1e-12, 1e-12, 1e-12,
        // 1e-12, 1e-12, 1e-16};
        // nlopt_set_xtol_abs (opt, xtol);
        nlopt_set_xtol_abs1 (opt, 1e-8);

        double xlo[opt_params::size] = {0., -1., -1., -1., -1.};
        double xhi[opt_params::size] = {2 * (p.m0 - 1.) / p.mass_rate, 1., 1.,
                                        1., 1.};

        nlopt_set_lower_bounds (opt, xlo);
        nlopt_set_upper_bounds (opt, xhi);

        double init_step[opt_params::size] = {xhi[0] * 1e-2, 1e-2, 1e-2, 1e-2,
                                              1e-2};
        nlopt_set_initial_step (opt, init_step);

        nlopt_add_equality_constraint (opt, eq_pv0unit, this, 1e-2);
        nlopt_add_equality_constraint (opt, eq_pv_dot_r, this, 1e-5);
        nlopt_add_equality_constraint (opt, eq_pv_mid_ap, this, 1e-6);
        nlopt_add_equality_constraint (opt, eq_ap, this, 1e-8);

        // nlopt_add_inequality_constraint (opt, neg_pv0_dot_pr0, this, 0.);
        // nlopt_add_inequality_constraint (opt, neg_swich, this, 0.);
        // nlopt_add_inequality_constraint (opt, neg_fuelmass, this, 0.);
        nlopt_add_inequality_constraint (opt, neg_altitude, this, 0.);
        // nlopt_add_inequality_constraint (opt, neg_r_dot_v, this, 0.);

        nlopt_set_maxeval (opt, 10000);
        nlopt_set_maxtime (opt, 5.);
    }

    ~optimizer () { nlopt_destroy (opt); }

    int optimize (opt_params &op, double eps)
    {
        double opt_f;
        epsilon    = eps;
        int result = nlopt_optimize (opt, op.tab, &opt_f);

        // std::cout << "after " << num_eval << " simulations, ";
        switch (result) {
        case NLOPT_SUCCESS:
            // std::cerr << "nlopt success\n";
            break;
        case NLOPT_STOPVAL_REACHED:
            // std::cout << "nlopt success stopval\n";
            break;
        case NLOPT_FTOL_REACHED:
            // std::cout << "nlopt success ftol\n";
            break;
        case NLOPT_XTOL_REACHED:
            // std::cout << "nlopt success xtol\n";
            break;
        case NLOPT_MAXEVAL_REACHED:
            std::cout << "nlopt success maxeval\n";
            break;
        case NLOPT_MAXTIME_REACHED:
            std::cout << "nlopt success maxtime\n";
            break;

        case NLOPT_FAILURE: std::cout << "nlopt FAILURE\n"; break;
        case NLOPT_INVALID_ARGS:
            std::cout << "nlopt FAILURE invalid args\n";
            break;
        case NLOPT_OUT_OF_MEMORY:
            std::cout << "nlopt FAILURE out of memory\n";
            break;
        case NLOPT_ROUNDOFF_LIMITED:
            std::cout << "nlopt FAILURE roundoff\n";
            result += 42;
            break;
        case NLOPT_FORCED_STOP:
            std::cout << "nlopt FAILURE forced stop\n";
            break;
        default: std::cout << "nlopt unknow return code " << result << "\n";
        }

        return result;
    }

    vship::state init_state (const opt_params &op)
    {
        vect3d r0{p.r0, 0., 0.};
        vect3d v0{0., p.v0, 0.};
        ship::simple_state x0{r0, v0, p.m0};

        vect3d pr0{op.pr0x (), op.pr0y (), 0.};
        vect3d pv0{op.pv0x (), op.pv0y (), 0.};
        ship::simple_state p0{pr0, pv0, 0.};

        return {x0, p0};
    }

    static double neg_altitude (unsigned, const double *x, double *, void *data)
    {
        optimizer &opt = *static_cast<optimizer *> (data);
        opt (x);

        double val = double(1. - opt.r_min);

        return val;
    }
    static double neg_r_dot_v (unsigned, const double *x, double *, void *data)
    {
        optimizer &opt = *static_cast<optimizer *> (data);
        opt (x);

        double val = double(-opt.r_dot_v_min);

        return val;
    }
    static double neg_pv0_dot_pr0 (unsigned, const double *x, double *, void *)
    {
        opt_params op{x};
        double val = op.pv0x () * op.pr0x () + op.pv0y () * op.pr0y ();

        std::cout << "pv0.pr0 = " << val << "\n";

        return val;
    }

    static double eq_pv0unit (unsigned, const double *x, double *, void *)
    {
        opt_params op{x};
        double val =                                            //
            op.pv0x () * op.pv0x () + op.pv0y () * op.pv0y () + // pv^2
            op.pr0x () * op.pr0x () + op.pr0y () * op.pr0y () + // pr^2
            -1.;

        // std::cout << "pv0^2 - 1 = " << val << "\n";

        return val;
    }

    static double eq_pv_mid_ap (unsigned, const double *x, double *, void *data)
    {
        optimizer &opt         = *static_cast<optimizer *> (data);
        const vship::state &yf = opt (x).y;

        scalar pv_mid =
            sqrt (square (opt.y_mid.p.v ())) - sqrt (square (yf.p.v ()));

        double val = double(pv_mid - opt.epsilon * opt.pv_mid0);
        // std::cout << "pv_mid " << pv_mid << " - " << opt.epsilon *
        // opt.pv_mid0
        //        << " = " << val << "\n";

        return val;
    }

    static double eq_ap (unsigned, const double *x, double *, void *data)
    {
        optimizer &opt         = *static_cast<optimizer *> (data);
        const vship::state &yf = opt (x).y;

        scalar ap = sqrt (square (yf.x.r ())) - opt.p.rf;

        // scalar ap0 = square (opt.y_ap0.x.r ()) - square (yf.x.r ());

        // double val = double((1 - opt.epsilon) * ap + opt.epsilon * ap0);
        double val = double(ap);
        // std::cout << "eq_pv_dot_r " << val << "\n";

        // std::cout << "(1 - eps) * (ap - rf) + eps * (ap0 - ap) = " << val
        //       << "\n";

        return val;
    }

    static double eq_pv_dot_r (unsigned, const double *x, double *, void *data)
    {
        optimizer &opt         = *static_cast<optimizer *> (data);
        const vship::state &yf = opt (x).y;

#if 0
        scalar theta  = yf.p.v () * yf.x.r ();
        scalar theta0 = opt.y_ap0.p.v () * opt.y_ap0.x.r ();
#else
        scalar theta  = angle (yf.x.v (), yf.p.v ());
        scalar theta0 = angle (opt.y_ap0.x.v (), opt.y_ap0.p.v ());
        theta0 *= 1.;
#endif

        double val = double(theta - opt.epsilon * opt.epsilon * theta0);
        // double val = double(theta);
        // std::cout << "eq_pv_dot_r " << val << "\n";
        //
        // double val =
        // double((1 - opt.epsilon) * yf.p.v () * yf.x.r ()
        //- opt.epsilon * (opt.y_ap0.p.v () * opt.y_ap0.x.r ()));

        // std::cout << "pvf.rf - eps (pv0.r0) = " << val << "\n";
        return val;
    }

    static double total_dv (unsigned, const double *x, double *, void *data)
    {
        optimizer &opt         = *static_cast<optimizer *> (data);
        const vship::state &yf = opt (x).y;

        scalar vf    = sqrt (square (yf.x.v ()));
        scalar vcirc = sqrt (1. / opt.p.rf);

        scalar mf = opt.p.m0 - opt.last_opt.tf () * opt.p.mass_rate;
        scalar dv_burn =
            opt.p.thrust / opt.p.mass_rate * std::log (double(opt.p.m0 / mf));

        scalar dv = abs (vf - vcirc) + dv_burn;

        scalar error0 = hadd ((yf - opt.y_ap0) * (yf - opt.y_ap0));

        return double((1 - opt.epsilon) * dv + opt.epsilon * error0);
    }

    state &operator() (const double *tab)
    {
        if (last_opt != tab) {
            last_opt   = tab;
            last_state = compute (last_opt);
        }

        return last_state;
    }

    state compute (const opt_params &op) { return compute (op, nullptr); }
    state compute (const opt_params &op, std::ostream *os);
};

double elliptic_speed (double r0, double r1)
{
    return math::sqrt (r1 / r0 * 2. / (r0 + r1));
}

std::ostream &operator<< (std::ostream &os, const optimizer::params &p)
{
    return os << p.m0 << " " << p.r0 << " " << p.v0 << " " << p.rf << " "
              << " " << p.thrust << " " << p.mass_rate;
}

std::ostream &operator<< (std::ostream &os, const optimizer::opt_params &p)
{
    return os << p.tf () << " " << p.pr0x () << " " << p.pr0y () << " "
              << p.pv0x () << " " << p.pv0y ();
}

double apoapsis (vect3d r, vect3d v)
{
    scalar r_ = sqrt (square (r));
    vect3d h  = r ^ v;
    vect3d e  = (v ^ h) - r / r_;
    scalar e_ = sqrt (square (e));
    scalar a  = r_ / (2 - r_ * square (v));

    return double(a * (1 + e_));
}
double apoapsis (ship::simple_state x) { return apoapsis (x.r (), x.v ()); }

double time_to_apoapsis (vect3d r, vect3d v)
{
    scalar r_ = sqrt (square (r));
    vect3d h  = r ^ v;
    vect3d e  = (v ^ h) - r / r_;
    scalar e_ = sqrt (square (e));
    scalar a  = r_ / (2 * r_ - square (v));

    scalar true_anomaly = angle (e, r);
    scalar tau =
        2 * atan2 (tan (double(.5 * true_anomaly)),
                   double(sqrt ((1 + e_) / (1 - e_)))); // eccentric anomaly;
    return double(a * sqrt (a) * (M_PI - tau + e_ * sin (double(tau))));
}
double time_to_apoapsis (ship::simple_state x)
{
    return time_to_apoapsis (x.r (), x.v ());
}

optimizer::state optimizer::compute (const opt_params &op, std::ostream *os)
{
    // if (os) std::cout << "opt_param " << op << "\n";
    // burn for tf time
    sim.init (init_state (op), 0, op.tf (), 1.);

    r_min       = square (sim->y.x.r ());
    r_dot_v_min = sim->y.x.r () * sim->y.x.v () / sqrt (square (sim->y.x.r ()));
    long i;
    for (i = 0; i < max_iterations && sim; ++i, ++sim) {
        r_min = min (r_min, square (sim->y.x.r ()));
        r_dot_v_min =
            min (r_dot_v_min,
                 sim->y.x.r () * sim->y.x.v () / sqrt (square (sim->y.x.r ())));
        if (os)
            (*os) << sim->t * unit.time                 //
                  << " " << sim->y.x.r () * unit.length //
                  << " " << sim->y.x.v () * unit.speed  //
                  << " " << sim->y.p.v ()               //
                  << " " << sim->u                      //
                  << "\n";
    }

    // std::cout << "rf " << sim->y.x.r () * unit.length << " vf "
    // << sim->y.x.v () * unit.speed << "\n";

    // coast until apoapsis
    // double ap = apoapsis (sim->y.x);

    y_mid = sim->y;
    sim.init (sim->y, op.tf (), op.tf () + 1000, 0.);
    int ap_count = 2;
    for (; i < max_iterations && sim; ++i, ++sim) {
        r_min = min (r_min, square (sim->y.x.r ()));
        if (os)
            (*os) << sim->t * unit.time                 //
                  << " " << sim->y.x.r () * unit.length //
                  << " " << sim->y.x.v () * unit.speed  //
                  << " " << sim->y.p.v ()               //
                  << " " << sim->u                      //
                  << "\n";
        if (sim->r_dot_v == 0.) {
            --ap_count;
            scalar d_r_dot_v =
                sim->dy.x.r () * sim->y.x.v () + sim->y.x.r () * sim->dy.x.v ();

            if (ap_count <= 0 || d_r_dot_v <= 0) break;
        }
    }

    scalar rf    = sqrt (square (sim->y.x.r ()));
    scalar vf    = sqrt (square (sim->y.x.v ()));
    scalar vcirc = sqrt (1. / p.rf);

    scalar mf      = p.m0 - op.tf () * p.mass_rate;
    scalar dv_burn = p.thrust / p.mass_rate * std::log (double(p.m0 / mf));

    scalar dv = abs (vf - vcirc) + dv_burn;

    if (os)
        printf ("%+7.3f^ %7.3fs | %8.3fm/s | %7.3fkm %7.3fkm %7.3fm/s %+7.3f^ "
                "%+7.5f\n" //
                ,
                180. / M_PI * atan2 (op.pv0y (), op.pv0x ()),
                op.tf () * unit.time, double(dv * unit.speed),
                double((rf - 1.) * unit.length * 1e-3),
                double((sqrt (r_min) - 1.) * unit.length * 1e-3),
                double(r_dot_v_min * unit.speed),
                double(180. / M_PI * angle (sim->y.x.v (), sim->y.p.v ())),
                double(sqrt (square (y_mid.p.v ()))
                       - sqrt (square (sim->y.p.v ()))));

    if (i >= max_iterations) {
        std::cout << "REACHED max_iteration in simulation\n";
    }

    if (abs (sim->y.x.r () * sim->y.x.v ()) > 1e-3) {
        std::cout << "BAD AP: r.v " << sim->y.x.r () * sim->y.x.v () << "\n";

        std::cout << "r0 " << y_mid.x.r () << " v0 " << y_mid.x.v () << " time "
                  << sim->t << "\n";
    }

    // std::cout << "r_ap " << sqrt (square (sim->y.x.r ())) << " ap "
    // << ap
    // << " r.v " << sim->y.x.r () * sim->y.x.v () << "\n";

    // std::cout << "r_ap " << sim->y.x.r () * unit.length << " v_ap "
    //<< sim->y.x.v () * unit.speed << " pv_ap " << sim->y.p.v ()
    //<< "\n";
    ++num_eval;

    return *sim;
}
int main (int, char *argv[])
{
    std::string dir = "./cfg/";

    auto planet = read_planet (dir + argv[1]);
    // std::cout << "mu " << planet.mu << "\n"
    // << "r0 " << planet.radius << "\n"
    // << "g0 " << planet.surface_gravity << "\n"
    // << "w  " << planet.rot_speed << "\n\n";

    auto vehicle = read_vehicle (dir + argv[2]);
    // std::cout << "m0  " << vehicle.wet_mass << "\n"
    // << "m1  " << vehicle.dry_mass << "\n"
    // << "isp " << vehicle.isp << "\n"
    // << "T   " << vehicle.max_thrust << "\n";

    unit = canonical_units (planet, vehicle);

    planet_radius = planet.radius / unit.length;

    double alt_0, alt_f, eps;

    getarg (argv[3], alt_0);
    getarg (argv[4], alt_f);
    getarg (argv[5], eps);

    double r0 = (alt_0 * 1000 + planet.radius) / unit.length;
    double rf = (alt_f * 1000 + planet.radius) / unit.length;

    double v0 = planet.rot_speed * planet.radius / unit.speed * r0;
    v0        = 0;

    double m0     = vehicle.wet_mass / unit.mass;
    double thrust = vehicle.max_thrust / unit.force;
    double mass_rate =
        (vehicle.max_thrust / (g0 * vehicle.isp)) / unit.mass_rate;

    std::cout << "ship m0     " << m0 << "\n";
    std::cout << "ship thrust " << thrust << "\n";
    std::cout << "ship m_rate " << mass_rate << " "
              << (vehicle.max_thrust / (g0 * vehicle.isp)) << "\n\n";

    std::cout << "r0 " << r0 << " " << r0 * unit.length << "\n";
    std::cout << "rf " << rf << " " << rf * unit.length << "\n";

    std::cout << "v0 " << v0 << " " << v0 * unit.speed << "\n";

    optimizer::params par{m0, r0, v0, rf, thrust, mass_rate};

    optimizer::opt_params op;

    {
        simulator<vship> sim{
            vship{ship::deriv{par.thrust, par.mass_rate}, ship::error{1e-8}}};

        double pitch = M_PI / 180. * 45;

        ship::simple_state x0{{r0, 0, 0}, {0, v0, 0}, m0};
        ship::simple_state p0{{1.5, 0.1, 0}, {cos (pitch), sin (pitch), 0}, 0};
        p0 /= sqrt (square (p0.r ()) + square (p0.v ()));
        ship::state y0{x0, p0};

        sim.init (y0, 0, m0 / mass_rate, 1.);

        for (; sim; ++sim) {
            double ap = apoapsis (sim->y.x);

            // std::cout << sim->t * unit.time << " "
            //<< sim->y.x.r () * unit.length << " " << ap * unit.length
            //<< " " << sim->y.p.v () << " "
            //<< "\n";

            std::cout << sim->t * unit.time << " " << (ap - 1) * unit.length
                      << "\n";
            if (ap > rf) break;
        }
        op.tf ()   = sim->t;
        op.pr0x () = double(p0.r ().x ());
        op.pr0y () = double(p0.r ().y ());
        op.pv0x () = double(p0.v ().x ());
        op.pv0y () = double(p0.v ().y ());

        double delta_v =
            double(thrust / mass_rate * log (m0 / sim->y.x.m ()) * unit.speed);
        std::cout << "delta-v spent " << delta_v << "\n";
    }

#if 0
    {
        // const double p[] = {0.200732, 0.770043, -0.0417107, 0.257817,
        // 0.582087};

        // clang-format off
        // const double p[] = {0.20408084466240617, 0.78045862160391666, -0.081047185928371582, 0.23986505990625345, 0.57164713474653084};
        // const double p[] = {0.20687611833307737, 0.77346545853409499, -0.070519882266130027, 0.22644611582082852, 0.58779272545104877};
        // const double p[] = {0.20826569063527914, 0.76924179746057253, -0.064027301632578776, 0.21822620354266631, 0.59711379633520367};
        // const double p[] = {0.20901790781211363, 0.76658905375423547, -0.059939290566623185, 0.21307623274547577, 0.6027827329558757};
        // const double p[] = {0.20940980612455162, 0.76505718072245887, -0.057588008745829658, 0.21012012286223672, 0.60598734778172347};
        const double p[] = {0.20994893902197795, 0.76271893302134375, -0.054030668425660233, 0.20564622351051304, 0.61077800650324698};

        // clang-format on
        op = p;
    }
#endif

    std::cout << "initial guess " << op << "\n";

    ship::state y_ap0;
    scalar pv_mid0;
    {
        optimizer opt{par};
        std::ofstream os{"data/tmp_init"};

        y_ap0 = opt.compute (op, &os).y;
        pv_mid0 =
            sqrt (square (opt.y_mid.p.v ())) - sqrt (square (y_ap0.p.v ()));
    }
    // std::exit (0);

    int count    = 0;
    double delta = eps;
    while (true) {
        optimizer opt{par};
        opt.y_ap0   = y_ap0;
        opt.pv_mid0 = pv_mid0;
        int res     = opt.optimize (op, 1. - eps);
        if (res < 0) return res;
        // std::cout << "OK at eps = " << eps << "\n";

        {
            std::ostringstream name;
            if (eps >= 1.)
                name << "data/tmp_final";
            else
                name << "data/tmp" << count;
            std::ofstream os{name.str ()};
            count++;
            os << std::setprecision (17);
            opt.compute (op, &os);

            // std::cout << "r.v  = " << y.x.r () * y.x.v () << "\n";
            // std::cout << "r.pv = " << y.x.r () * y.p.v () << "\n";
        }
        if (eps >= 1. && count > 112) break;
// if (eps >= 1.) break;

#if 0
        optimizer::eq_inclination (optimizer::opt_params::size, op.tab, nullptr,
                                   &opt);
        optimizer::eq_eccentricity (optimizer::opt_params::size, op.tab,
                                    nullptr, &opt);
        optimizer::eq_semimajor (optimizer::opt_params::size, op.tab, nullptr,
                                 &opt);
        optimizer::neg_swich (optimizer::opt_params::size, op.tab, nullptr,
                              &opt);
        optimizer::mass (optimizer::opt_params::size, op.tab, nullptr, &opt);
#endif

        // break;
        eps = math::min (1., eps + delta);
    }

    std::cout << std::setprecision (17) << "const double p[] = {" << op.tf ()
              << ", " << op.pr0x () << ", " << op.pr0y () << ", " << op.pv0x ()
              << ", " << op.pv0y () << "};\n";

    std::cout << "OK\n";
}
