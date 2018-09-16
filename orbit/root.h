#pragma once

#include "math.h"

struct root {

    double tol;

    root (double tol = 1e-9)
        : tol{tol_corrected (tol)}
    {
        // std::cerr << "root tol " << this->tol << "\n";
    }

    static double tol_corrected (double tol)
    {
        return std::pow (tol, 1. / 1.84);
    }

    template <typename Function>
    double operator() (double x0, double x1, Function f)
    {
        return operator() (x0, x1, f, f (x0), f (x1));
    }

    template <typename Function>
    double operator() (double x0, double x1, Function f, double f0, double f1)
    {
        // std::cerr << x0 << " " << f0 << "\n";
        if (f0 == 0) return x0;
        // std::cerr << x1 << " " << f1 << "\n";
        if (f1 == 0) return x1;

        if (math::sign (f0) == math::sign (f1)) return 0. / 0.;

        double xm, fm;
        goto begin;
        do {
            if (math::sign (f0) == math::sign (fm)) {
                x0 = xm;
                f0 = fm;
            } else {
                x1 = xm;
                f1 = fm;
            }

        begin:
            xm = .5 * (x0 + x1);
            fm = f (xm);
            // std::cerr << xm << " " << fm << "\n";
            if (fm == 0) return xm;

        } while (math::abs (x1 - x0) > tol);

        math::v2d r{2 * fm, f0 + f1 - 2 * fm};
        double diff = .5 * (f0 - f1);
        r /= math::v2d{diff, diff};

        double denom = 1. + math::sqrt (1. - r[0] * r[1]);
        double u     = std::isinf (denom) ? math::sign (diff) : r[0] / denom;

        // std::cerr << "u = " << u << "\n";

        double x = .5 * ((1. + u) * x1 + (1. - u) * x0);
        // std::cerr << "x = " << x << " f (x) = " << f (x) << "\n";

        return x;
    }
};
