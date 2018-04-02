#include <iostream>

#include "ship.h"
#include "simulator.h"
#include <cmath>

#include <util/getarg.h>

using math::vect3d;

template <typename T> struct printer {
    const T &t;
    printer (const T &t)
        : t{t}
    {
    }
};
template <typename T> printer<T> print (const T &t) { return t; }

template <typename Ship>
std::ostream &operator<< (std::ostream &os, printer<simulator<Ship>> sim)
{
    auto s = *(sim.t);

    double x{s.y.x.r ().x ()};
    double y{s.y.x.r ().y ()};

    double prx{s.y.p.r ().x ()};
    double pry{s.y.p.r ().y ()};

    double pvx{s.y.p.v ().x ()};
    double pvy{s.y.p.v ().y ()};

    return os << s.t << " "               // 1
              << x << " " << y << " "     // 2 3
              << prx << " " << pry << " " // 4 5
              << pvx << " " << pvy << " " // 6 7
              << double(s.y.p.m ()) << " " << s.swich << " "
              << s.d_swich; // 8 9 10
}

int main (int, char *argv[])
{
    double tol, ap, lon = 0, lat = 0, swich0;

    getarg (argv[1], tol);
    getarg (argv[2], ap);
    getarg (argv[3], swich0);

    double pe         = 1;
    double semi_major = .5 * (pe + ap);
    double v_pe       = math::sqrt ((ap / pe) / semi_major);
    double period     = 2 * M_PI * math::sqrt (semi_major) * semi_major;

    double tf = .6 * period;

    lon *= M_PI / 180.;
    lat *= M_PI / 180.;

    vect3d r0{cos (lat) * cos (lon), cos (lat) * sin (lon), sin (lat)};
    r0 *= pe;
    // std::cout << "r0 " << double(r0.x ()) << " " << double(r0.y ()) << " "
    //<< double(r0.z ()) << "\n";

    vect3d v0 = vect3d{0, 0, 1} ^ r0;
    v0        = v_pe / sqrt (v0 * v0) * v0;
    // std::cout << "v0 " << double(v0.x ()) << " " << double(v0.y ()) << " "
    //<< double(v0.z ()) << "\n";

    vect3d pr0 = r0 / sqrt (square (r0));
    vect3d pv0 = v0 / sqrt (square (v0));

    pr0 *= sqrt (.5) + (1 - sqrt (.5)) * std::pow (.75, std::pow (ap, 5. / 3));

    ship::deriv f;
    ship::error e{tol};
    vship::state y0{ship::simple_state{r0, v0, 1},
                    ship::simple_state{pr0, pv0, 0}};
    y0.p.set_m (f.pm_for_swich (y0, swich0));

    simulator<vship> sim{vship{f, e}, y0, 0, tf, 0.};

    for (sim.set_t_final (tf); sim; ++sim) {

        std::cout << print (sim) << "\n";
        // std::cout << sim->t << " " << x << " " << y << " " << dt << "\n";
    }
    std::cout << print (sim) << "\n";
}
