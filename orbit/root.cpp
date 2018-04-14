#include <iostream>

#include "root.h"

#include <util/getarg.h>

int main (int, char *argv[])
{
    double a;
    double x0;
    double x1;
    double tol;

    getarg (argv[1], a);
    getarg (argv[2], x0);
    getarg (argv[3], x1);
    getarg (argv[4], tol);

    x0 *= .5 * M_PI;
    x1 *= .5 * M_PI;

    root r{tol};

    double x = r (x0, x1, [a](double x) { return std::sin (x) - a; });

    std::cout << "x = " << x << " f = " << std::sin (x) - a << "\n";

    double e = std::asin (a);

    std::cout << "x error " << x - e << "\n";
}
