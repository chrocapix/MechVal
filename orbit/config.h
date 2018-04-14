#pragma once
#include "units.h"

#include <string>

struct planet {
    double mu;
    double radius;
    double surface_gravity;
    double rot_speed;
};

const double g0 = 9.81;

struct vehicle {
    double wet_mass;
    double dry_mass;
    double isp;
    double max_thrust;
};

planet read_planet (std::string name);
vehicle read_vehicle (std::string name);

static inline units canonical_units (const planet &p, const vehicle &v)
{
    return {units::len_accel_mass{}, p.radius, p.surface_gravity, v.dry_mass};
}
