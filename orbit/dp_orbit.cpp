#include "ship.h"
#include "simulator.h"
#include <iostream>

#include <util/getarg.h>

using math::vect3d;

int main (int, char *argv[])
{
    double tol, ap, lon, lat, num_orbit;

    getarg (argv[1], tol);
    getarg (argv[2], ap);
    getarg (argv[3], lon);
    getarg (argv[4], lat);
    getarg (argv[5], num_orbit);

    double pe         = 1;
    double semi_major = .5 * (pe + ap);
    double v_pe       = math::sqrt ((ap / pe) / semi_major);
    double period     = 2 * M_PI * math::sqrt (semi_major) * semi_major;

    double tf = period * num_orbit;

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

    vship::state y0{ship::simple_state{r0, v0, 0},
                    ship::simple_state{vect3d{0}, vect3d{0}, 0}};

    ship::deriv f;
    ship::error e{tol};
    simulator<vship> sim{vship{f, e}, y0, 0, tf, 0.};

    int count = 0;
    for (sim.set_t_final (tf); sim; ++sim) {
        ++count;

        // double x{sim->y.x.r ().x ()};
        // double y{sim->y.x.r ().y ()};
        // double dt = sim->t_next - sim->t;

        // std::cout << sim->t << " " << x << " " << y << " " << dt << "\n";
    }

    double r_error = double(sqrt (square (sim->y.x.r () - r0) / square (r0)));
    double v_error = double(sqrt (square (sim->y.x.v () - v0) / square (v0)));

    std::cout << sim->t << " " << r_error << " " << v_error << " " << count
              << "\n";
}
