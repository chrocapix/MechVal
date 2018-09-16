#include <iostream>

#include "ship.h"
#include "simulator.h"

#include <util/getarg.h>

using math::vect3d;
using math::scalar;

int main (int, char *argv[])
{
    double tol = 1e-8;
    double r0x, r0y, v0x, v0y;

    getarg (argv[1], r0x);
    getarg (argv[2], r0y);
    getarg (argv[3], v0x);
    getarg (argv[4], v0y);

    vect3d r0{r0x, r0y, 0};
    vect3d v0{v0x, v0y, 0};

    scalar r0_ = sqrt (square (r0));

    std::cout << "r = " << double(r0.x ()) << " " << double(r0.y ()) << " "
              << double(r0.z ()) << "\n";
    std::cout << "v = " << double(v0.x ()) << " " << double(v0.y ()) << " "
              << double(v0.z ()) << "\n";

    vect3d h0 = r0 ^ v0;
    std::cout << "     angular mom = " << double(h0.x ()) << " "
              << double(h0.y ()) << " " << double(h0.z ()) << "\n";
    vect3d e0 = (v0 ^ h0) - r0 / sqrt (square (r0));

    // std::cout << "    eccentricity = " << double(e0.x ()) << " "
    //<< double(e0.y ()) << " " << double(e0.z ()) << "\n";
    // w    e0 -= r0 / sqrt (square (r0));
    std::cout << "    eccentricity = " << double(e0.x ()) << " "
              << double(e0.y ()) << " " << double(e0.z ()) << "\n";
    scalar e_ = sqrt (square (e0));

    std::cout << "    eccentricity = " << double(e_) << "\n";
    if (e_ >= 1.) {
        std::cerr << "ERROR: hyperbolic orbit\n";
        return 2;
    }

    scalar true_anomaly = angle (e0, r0);
    scalar tau =
        2 * atan2 (tan (double(.5 * true_anomaly)),
                   double(sqrt ((1 + e_) / (1 - e_)))); // eccentric anomaly

    // tau = 2 * atan2 (double(sqrt ((1 - e_) / (1 + e_))),
    //               tan (double(.5 * true_anomaly)));

    std::cout << "eccentric anomaly " << double(tau) << "\n";
    // tau = (2 - square (v0) * r0_) / e_;
    // std::cout << "eccentric anomaly " << double(tau) << "\n";
    // tau = acos (double(tau));
    // std::cout << "eccentric anomaly " << double(tau) << "\n";

    scalar a  = r0_ / (2 * r0_ - square (v0));
    scalar ap = a * (1 + e_);
    // scalar pe = a * (1 + e_);

    double time_to_ap =
        double(a * sqrt (a) * (M_PI - tau + e_ * sin (double(tau))));

    std::cout << "        apoapsis = " << double(ap) << "\n";
    std::cout << "time to apoapsis = " << double(time_to_ap) << "\n";
//<< double(r0.z ()) << "\n";

#if 1

    vship::state y0{ship::simple_state{r0, v0, 1.},
                    ship::simple_state{vect3d{0}, vect3d{0}, 0}};

    ship::deriv f;
    ship::error e{tol};
    simulator<vship> sim{vship{f, e}, y0, 0, time_to_ap, 0.};

    int count = 0;
    for (sim.set_t_final (time_to_ap + 1); sim; ++sim) {
        ++count;

        vect3d r = sim->y.x.r ();
        vect3d v = sim->y.x.v ();

        std::cout << sim->t << " "                                  //
                  << double(r.x ()) << " " << double(r.y ()) << " " //
                  << double(v.x ()) << " " << double(v.y ()) << " " //
                  << double(r * v) << " "                           //
                  << "\n";
    }
    vect3d r = sim->y.x.r ();
    vect3d v = sim->y.x.v ();
    // double dt = sim->t_next - sim->t;
    std::cout << sim->t << " "                                  //
              << double(r.x ()) << " " << double(r.y ()) << " " //
              << double(v.x ()) << " " << double(v.y ()) << " " //
              << double(r * v) << " "                           //
              << "\n";

// double r_error = double(sqrt (square (sim->y.x.r () - r0) / square (r0)));
// double v_error = double(sqrt (square (sim->y.x.v () - v0) / square (v0)));

// std::cout << sim->t << " " << r_error << " " << v_error << " " << count
//         << "\n";
#endif
}
