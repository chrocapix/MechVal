#pragma once
#include "math.h"

struct units {
    double mass;
    double length;
    double time;

    double mass_rate;
    double speed;
    double acceleration;
    double force;

    struct len_accel_mass {
    };

    units (len_accel_mass, double len, double accel, double mass)
        : mass{mass}
        , length{len}
        , time{math::sqrt (length / accel)}
        , mass_rate{mass / time}
        , speed{math::sqrt (length * accel)}
        , acceleration{accel}
        , force{mass * accel}
    {
    }
};
