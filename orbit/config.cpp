#include "config.h"

#include <fstream>
#include <iostream>

planet read_planet (std::string name)
{
    std::ifstream is{name};

    double r0, g, period;

    is >> r0 >> g >> period;

    r0 *= 1000;

    return {r0 * g * g, r0, g, 2 * M_PI / period};
}

vehicle read_vehicle (std::string name)
{

    std::ifstream is{name};

    double wm, dm, t, isp;

    is >> wm >> dm >> t >> isp;

    wm *= 1000;
    dm *= 1000;
    t *= 1000;

    return {wm, dm, isp, t};
}
