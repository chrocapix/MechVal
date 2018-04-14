#include <iostream>

#include "config.h"
#include "units.h"

#include "ship.h"
#include "simulator.h"

#include <util/getarg.h>

using math::vect3d;

struct params {
    double m0;
    double r0;
    double v0;
    double rf;
    double vf;
    ship::deriv f;
};

struct opt_params {
    static const int size = 6;
    double tab[size];

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

vship::state init_state (const params &p, const opt_params &op)
{
    vect3d r0{p.r0, 0., 0.};
    vect3d v0{0., p.v0, 0.};
    ship::simple_state x0{r0, v0, p.m0};

    vect3d pr0{op.pr0x (), op.pr0y (), 0.};
    vect3d pv0{op.pv0x (), op.pv0y (), 0.};
    ship::simple_state p0{pr0, pv0, 0.};

    vship::state y0{x0, p0};

    y0.p.set_m (p.f.pm_for_swich (y0, op.swich0 ()));

    return y0;
}

double elliptic_speed (double r0, double r1)
{
    return math::sqrt (r1 / r0 * 2. / (r0 + r1));
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

    auto unit = canonical_units (planet, vehicle);

    double alt_0, alt_f;

    getarg (argv[3], alt_0);
    getarg (argv[4], alt_f);

    double r0 = (alt_0 * 1000 + planet.radius) / unit.length;
    double rf = (alt_f * 1000 + planet.radius) / unit.length;

    double v0 = planet.rot_speed * planet.radius / unit.speed * r0;
    double vf = elliptic_speed (rf, rf);

    std::cout << "ship m0     " << vehicle.wet_mass / unit.mass << "\n";
    std::cout << "ship thrust " << vehicle.max_thrust / unit.force << "\n";
    std::cout << "ship m_rate "
              << (vehicle.max_thrust / (g0 * vehicle.isp)) / unit.mass_rate
              << " " << (vehicle.max_thrust / (g0 * vehicle.isp)) << "\n\n";

    std::cout << "r0 " << r0 << " " << r0 * unit.length << "\n";
    std::cout << "rf " << rf << " " << rf * unit.length << "\n";

    std::cout << "v0 " << v0 << " " << v0 * unit.speed << "\n";
    std::cout << "vf " << vf << " " << vf * unit.speed << "\n\n";

    double a    = .5 * (r0 + rf);
    double tf_0 = M_PI * math::sqrt (a) * a;

    std::cout << "tf_0  " << tf_0 << " " << tf_0 * unit.time << "\n";

    double v0_0  = elliptic_speed (r0, rf);
    double vf_0  = elliptic_speed (rf, r0);
    double dv_0  = math::sqrt (2. * rf / (r0 + rf)) - 1.;
    double pr0_0 = std::pow (r0, -1.5) * (1 - dv_0 * dv_0 * (1.5 + .5 * dv_0));
    std::cout << "v0_0  " << v0_0 << " " << v0_0 * unit.speed << "\n";
    std::cout << "vf_0  " << vf_0 << " " << vf_0 * unit.speed << "\n";
    std::cout << "pr0_0 " << pr0_0 << "\n";
}
