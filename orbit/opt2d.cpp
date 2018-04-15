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
    return os << v.x () << " " << v.y () << " " << v.z ();
}

units unit;

struct optimizer {
    struct params {
        double m0;
        double r0;
        double v0;
        double apf;
        double pef;

        double thrust;
        double mass_rate;
    };

    struct opt_params {
        static const int size = 6;
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
        double swich0 () const { return tab[5]; }

        double &tf () { return tab[0]; }
        double &pr0x () { return tab[1]; }
        double &pr0y () { return tab[2]; }
        double &pv0x () { return tab[3]; }
        double &pv0y () { return tab[4]; }
        double &swich0 () { return tab[5]; }
    };

    params p;
    simulator<vship> sim;
    long max_iterations = 10000;

    opt_params last_opt;
    typedef simulator<vship>::state state;
    state last_state;
    nlopt_opt opt;
    long num_eval = 0;

    optimizer (const optimizer &) = delete;
    optimizer (optimizer &&)      = delete;
    optimizer &operator= (const optimizer &) = delete;
    optimizer &operator= (optimizer &&) = delete;

    optimizer (const params &p, double sim_tol = 1e-8)
        : p{p}
        , sim{vship{ship::deriv{p.thrust, p.mass_rate}, ship::error{sim_tol}}}
    {
        opt = nlopt_create (NLOPT_LN_COBYLA, opt_params::size);
        std::cerr << "nlopt algo "
                  << nlopt_algorithm_name (nlopt_get_algorithm (opt)) << "\n";

        // nlopt_set_max_objective (opt, mass, this);
        nlopt_set_min_objective (opt, sqr_swich, this);
        nlopt_set_ftol_abs (opt, 1e-9);
        // double xtol[opt_params::size] = {1e-12, 1e-12, 1e-12,
        // 1e-12, 1e-12, 1e-16};
        // nlopt_set_xtol_abs (opt, xtol);

        double a      = .5 * (p.apf + p.pef);
        double period = 2 * M_PI * math::sqrt (a) * a;
        std::cerr << "period " << period << "\n";
        double xlo[opt_params::size] = {0.01 * period, -1., -1., -1., -1., 0.};
        double xhi[opt_params::size] = {period, 1., 1., 1., 1., 1.};

        nlopt_set_lower_bounds (opt, xlo);
        nlopt_set_upper_bounds (opt, xhi);

        nlopt_set_initial_step1 (opt, 1e-6);

        nlopt_add_equality_constraint (opt, eq_pv0unit, this, 1e-12);
        nlopt_add_equality_constraint (opt, eq_semimajor, this, 1e-8);
        nlopt_add_equality_constraint (opt, eq_eccentricity, this, 1e-8);
        nlopt_add_equality_constraint (opt, eq_inclination, this, 1e-8);

        // nlopt_add_inequality_constraint (opt, neg_swich, this, 0.);
        nlopt_add_inequality_constraint (opt, neg_fuelmass, this, 0.);

        nlopt_set_maxeval (opt, 10000);
        nlopt_set_maxtime (opt, 5.);
    }

    ~optimizer () { nlopt_destroy (opt); }

    int optimize (opt_params &op)
    {
        double opt_f;
        int result = nlopt_optimize (opt, op.tab, &opt_f);

        std::cout << "after " << num_eval << " simulations, ";
        switch (result) {
        case NLOPT_SUCCESS: std::cerr << "nlopt success\n"; break;
        case NLOPT_STOPVAL_REACHED:
            std::cout << "nlopt success stopval\n";
            break;
        case NLOPT_FTOL_REACHED: std::cout << "nlopt success ftol\n"; break;
        case NLOPT_XTOL_REACHED: std::cout << "nlopt success xtol\n"; break;
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

        return sim.pm_for_swich (vship::state{x0, p0}, op.swich0 ());
    }

    static double eq_pv0unit (unsigned, const double *x, double *, void *)
    {
        opt_params op{x};
        return op.pv0x () * op.pv0x () + op.pv0y () * op.pv0y () - 1.;
    }

    static double eq_semimajor (unsigned, const double *x, double *, void *data)
    {
        optimizer &opt         = *static_cast<optimizer *> (data);
        const vship::state &yf = opt (x).y;

        scalar v2 = square (yf.x.v ());
        scalar r2 = square (yf.x.r ());
        scalar r  = sqrt (r2);
        scalar a  = 1. / (2. / r - v2);

        scalar opt_a = .5 * (opt.p.apf + opt.p.pef);

        std::cerr << "eq_semimajor exp " << double(opt_a * unit.length)
                  << " act " << double(a * unit.length) << " diff "
                  << (opt_a - a) * unit.length << "\n";

        return double(opt_a - a);
    }

    static double eq_eccentricity (unsigned, const double *x, double *,
                                   void *data)
    {
        optimizer &opt         = *static_cast<optimizer *> (data);
        const vship::state &yf = opt (x).y;

        // scalar v2 = square (yf.x.v ());
        scalar r2 = square (yf.x.r ());
        scalar r  = sqrt (r2);
        // scalar a  = 1. / (2. / r - v2);

        vect3d ev = (yf.x.v () ^ (yf.x.r () ^ yf.x.v ())) - yf.x.r () / r;

        // std::cerr << "r^    " << yf.x.r () / r << "\n";
        // std::cerr << "h     " << (yf.x.r () ^ yf.x.v ()) << "\n";
        // std::cerr << "v ^ h " << (yf.x.v () ^ (yf.x.r () ^ yf.x.v ())) <<
        // "\n";

        // std::cerr << "ev    " << ev << "\n";
        scalar e = sqrt (square (ev));

        double opt_e = (opt.p.apf - opt.p.pef) / (opt.p.apf + opt.p.pef);
        std::cerr << "eq_eccentri. exp " << double(opt_e) << " act "
                  << double(e) << " diff " << opt_e - e << "\n";

        return double(opt_e - e);
    }

    static double eq_inclination (unsigned, const double *x, double *,
                                  void *data)
    {
        optimizer &opt         = *static_cast<optimizer *> (data);
        const vship::state &yf = opt (x).y;

        vect3d up = yf.x.r () ^ yf.x.v ();
        up /= sqrt (square (up));

        scalar incl = abs (up.x ()) + abs (up.y ());
        std::cerr << "eq_inclin.   " << double(incl) << "\n";
        return double(incl);
    }

    static double neg_swich (unsigned, const double *x, double *, void *data)
    {
        optimizer &opt  = *static_cast<optimizer *> (data);
        const state &sf = opt (x);

        std::cerr << "neg_swich.   " << -sf.swich << "\n";

        return -sf.swich;
    }

    static double sqr_swich (unsigned, const double *x, double *, void *data)
    {
        optimizer &opt  = *static_cast<optimizer *> (data);
        const state &sf = opt (x);

        double s = sf.swich * sf.swich;

        std::cerr << "sqr_swich.   " << s << "\n";

        return s;
    }

    static double mass (unsigned, const double *x, double *, void *data)
    {
        optimizer &opt  = *static_cast<optimizer *> (data);
        const state &sf = opt (x);

        std::cerr << "mass.        " << sf.y.x.m () * unit.mass << "\n";

        double c       = opt.p.thrust / opt.p.mass_rate;
        scalar delta_v = c * log (opt.p.m0 / sf.y.x.m ());

        std::cerr << "delta-V        " << delta_v * unit.speed << " m/s\n";
        return double(sf.y.x.m ());
    }

    static double neg_fuelmass (unsigned, const double *x, double *, void *data)
    {
        optimizer &opt  = *static_cast<optimizer *> (data);
        const state &sf = opt (x);

        scalar m = sf.y.x.m () - opt.p.m0;
        std::cerr << "neg mass.    " << m * unit.mass << "\n";

        return double(m);
    }

    state &operator() (const double *tab)
    {
        if (last_opt != tab) {
            last_opt   = tab;
            last_state = compute (last_opt);
        }

        return last_state;
    }

    state compute (const opt_params &op);
    state compute (const opt_params &op, std::ostream &os)
    {
        os << std::setprecision (17);
        sim.init (init_state (op), 0, op.tf ());
        for (long i = 0; i < max_iterations && sim; ++i, ++sim) {
            os << sim->t * unit.time << " " << sim->y.x.r ().x () * unit.length
               << " " << sim->y.x.r ().y () * unit.length << " "
               << sim->y.p.v ().x () << " " << sim->y.p.v ().y () << " "
               << sim->swich << "\n";
        }

        return *sim;
    }
};

double elliptic_speed (double r0, double r1)
{
    return math::sqrt (r1 / r0 * 2. / (r0 + r1));
}

struct params {
    double m0;
    double r0;
    double v0;
    double rf;

    double thrust;
    double mass_rate;
};

optimizer::params eps_params (const params &p, double eps)
{
    double v0_0 = elliptic_speed (p.r0, p.rf);
    double vf_0 = elliptic_speed (p.rf, p.r0);

    double v0_1 = p.v0;
    double vf_1 = elliptic_speed (p.rf, p.rf);

    double vf = vf_0 * (1. - eps) + vf_1 * eps;

    double pef = p.rf / (2. / (p.rf * vf * vf) - 1.);

    return {p.m0,                                     //
            p.r0,     v0_0 * (1. - eps) + v0_1 * eps, //
            p.rf,     pef,                            //
            p.thrust, p.mass_rate};
}

std::ostream &operator<< (std::ostream &os, const optimizer::params &p)
{
    return os << p.m0 << " " << p.r0 << " " << p.v0 << " " << p.apf << " "
              << p.pef << " " << p.thrust << " " << p.mass_rate;
}

std::ostream &operator<< (std::ostream &os, const optimizer::opt_params &p)
{
    return os << p.tf () << " " << p.pr0x () << " " << p.pr0y () << " "
              << p.pv0x () << " " << p.pv0y () << " " << p.swich0 ();
}

optimizer::state optimizer::compute (const opt_params &op)
{
    std::cout << op << "\n";
    sim.init (init_state (op), 0, op.tf ());
    for (long i = 0; i < max_iterations && sim; ++i, ++sim) //
        ;

    std::cerr << "rf " << sim->y.x.r () * unit.length << " vf "
              << sim->y.x.v () * unit.speed << "\n";
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

    double alt_0, alt_f, eps;

    getarg (argv[3], alt_0);
    getarg (argv[4], alt_f);
    getarg (argv[5], eps);

    double r0 = (alt_0 * 1000 + planet.radius) / unit.length;
    double rf = (alt_f * 1000 + planet.radius) / unit.length;

    double v0 = planet.rot_speed * planet.radius / unit.speed * r0;
    double vf = elliptic_speed (rf, rf);

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
    std::cout << "vf " << vf << " " << vf * unit.speed << "\n\n";

    double a    = .5 * (r0 + rf);
    double tf_0 = M_PI * math::sqrt (a) * a;

    double v0_0  = elliptic_speed (r0, rf);
    double vf_0  = elliptic_speed (rf, r0);
    double dv_0  = math::sqrt (2. * rf / (r0 + rf)) - 1.;
    double pr0_0 = std::pow (r0, -1.5) * (1 - dv_0 * dv_0 * (1.5 + .5 * dv_0));
    std::cout << "v0_0  " << v0_0 << " " << v0_0 * unit.speed << "\n";
    std::cout << "vf_0  " << vf_0 << " " << vf_0 * unit.speed << "\n";

    params par{m0, r0, v0, rf, thrust, mass_rate};
    for (int i = 0; i <= 10; ++i) {
        std::cout << eps_params (par, i / 10.) << "\n";
    }

    std::cout << "tf_0  " << tf_0 << " " << tf_0 * unit.time << "\n";
    std::cout << "pr0_0 " << pr0_0 << "\n";

    optimizer::opt_params op;

    op.tf ()     = tf_0;
    op.pr0x ()   = pr0_0;
    op.pr0y ()   = 0.;
    op.pv0x ()   = 0.;
    op.pv0y ()   = 1.;
    op.swich0 () = 0.;

    std::cout << "initial guess " << op << "\n";

    double delta = eps;
    while (eps < 1.) {
        optimizer opt{eps_params (par, eps)};
        int res = opt.optimize (op);
        if (res < 0) return res;
        std::cout << "OK at eps = " << eps << "\n";

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

        std::ofstream os{"data/tmp"};
        opt.compute (op, os);

        // break;
        eps = math::min (1., eps + delta);
    }
}
