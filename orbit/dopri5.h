#pragma once

#define dopri5_unlikely(expr) __builtin_expect (!!(expr), 0)
#define dopri5_likely(expr) __builtin_expect (!!(expr), 1)

#include "math.h"

struct error_diff {
    double rtol = 1e-6;
    double atol = 1e-9;

    template <typename Y>
    double operator() (const Y &err, const Y &, const Y &dy) const
    {
        return math::rsqrt (hadd (square (err / (atol + rtol * abs (dy)))));
    }
};

template <typename Function, typename Error = error_diff> struct dopri5 {
    Function f;
    Error error;

    double h_min = 1e-8;
    double h_max = 1e8;

    double t_final = 1.;

    dopri5 (const Function &f = Function (), const Error &error = Error ())
        : f{f}
        , error{error}
    {
    }

    template <typename State, typename Y, typename Control>
    void init (State &s0, const Y &y0, double t0, double t1, const Control &u)
    {
        s0.t      = t0;
        s0.y      = y0;
        s0.dy     = f (t0, y0, u);
        s0.t_next = s0.t + h_init (s0, t1, u);
        s0.u      = u;
    }

    template <typename State> double step (State &s1, const State &s0) const
    {
        double t0 = s0.t;
        double t1 = s0.t_next;
        if ((t1 - t_final > 0.) == (t1 - t0 > 0.)
            || ((t_final - t0 > 0.) == (t1 - t0 > 0.)
                && std::abs (t_final - t1) < .1 * std::abs (t_final - s0.t))) {
            t1 = t_final;
        }

        return step<State, false> (s1, s0, t1);
    }

    template <typename State>
    double force_step (State &s1, const State &s0, double t1) const
    {
        return step<State, true> (s1, s0, t1);
    }

    template <typename State, typename Control>
    double h_init (const State &s0, double t1, const Control &u)
    {
        typedef decltype (s0.y) Y;

        // std::cout << "y0 = " << double(s0.y) << "\n";
        // std::cout << "dy0 = " << double(s0.dy) << "\n";
        double ridnf = error (s0.dy, s0.y, s0.y); // ridnf == dnf**-.5
        // std::cerr << "ridnf = " << ridnf << " dnf = " << 1. / (ridnf * ridnf)
        // << "\n";
        double ridny = error (s0.y, s0.y, s0.y); //  ridny == dny**-.5
        // std::cerr << "ridny = " << ridny << " dny = " << 1. / (ridny * ridny)
        // << "\n";

        double h;
        if (ridnf > 1e5 || ridny > 1e5) // dnf || dny < 1e-10
            h = 1e-6;
        else
            h = .01 * ridnf / ridny; // .01 * sqrt (dny / dnf)

        h = math::min (h, h_max);
        h = std::copysign (t1 - s0.t, h);
        // std::cout << "h = " << h << "\n";

        Y dy1 = f (s0.t + h, s0.y + h * s0.dy, u);
        // std::cout << "dy1 = " << double(dy1) << "\n";
        double ider2 = error (dy1 - s0.dy, s0.y, s0.y) * h; // 1. / der2
        // std::cerr << "ider2 = " << ider2 << " der2 = " << 1. / ider2 << "\n";

        double ider12 =
            math::min (math::abs (ider2), ridnf); // 1 / max (|der2|, sqrt(dnf))
        // std::cerr << "ider12 = " << ider12 << " der12 = " << 1. / ider12
        // << "\n";

        double h1;
        if (ider12 >= 1e15) // der12 <= 1e-15
            h1 = math::max (1e-6, math::abs (h) * 1e-3);
        else
            h1 = std::pow (.01 * ider12, .2);
        // std::cerr << "h1 = " << h1 << "\n";

        h = math::min (100 * h, math::min (h1, h_max));
        h = math::max (h, h_min);

        h = std::copysign (h, t1 - s0.t);
        // std::cerr << "h = " << h << "\n";
        return h;
    }

  private:
    template <typename State, bool force>
    double step (State &s1, const State &s0, double t1) const
    {
        double h = t1 - s0.t;
        while (true) {
            typedef decltype (s0.y) Y;
            Y y1, dy1;
            double crit   = eval (y1, dy1, s0, t1);
            double ratio  = clamp_root56 (.5 * crit);
            double h_next = h_clamp (h * ratio);
            // std::cerr << "trying h = " << h << " [ " << h_min << " " << h_max
            // << " ]  crit " << crit << " ratio " << ratio << "\n";

            if (dopri5_likely (force || crit >= 1 || std::abs (h) <= h_min)) {
                s1.set (t1, y1, dy1);
                // s1.t      = t1;
                // s1.y      = y1;
                // s1.dy     = dy1;
                s1.t_next = t1 + h_next;
                // std::cerr << "  accept h " << h << " -> " << h_next << " [ "
                // << h_min << " " << h_max << " ]...\n";

                return crit;
            }

            // if (math::abs (h) == h_min) {
            // std::cerr << "t = " << s0.t << "  reject h " << h << " -> "
            //<< h_next << " [ " << h_min << " " << h_max
            //<< " ] crit " << crit << " ratio " << ratio << "\n";
            //}
            h  = h_next;
            t1 = s0.t + h;
        }
    }

    template <typename State, typename Y>
    double eval (Y &y1, Y &dy1, const State &s0, double t1) const
    {
        math::scalar t = s0.t, h = t1 - t;

        const Y &y  = s0.y;
        const Y &k0 = s0.dy;

        // clang-format off
        Y k1 = f (t + h * ct[1],
                  y + h * c1[0] * k0,
                  s0.u);
        Y k2 = f (t + h * ct[2],
                  y + h * (c2[0] * k0 + c2[1] * k1),
                  s0.u);
        Y k3 = f (t + h * ct[3],
                  y + h * (c3[0] * k0 + c3[1] * k1 + c3[2] * k2),
                  s0.u);
        Y k4 = f (t + h * ct[4],
                  y + h * (c4[0] * k0 + c4[1] * k1 + c4[2] * k2 + c4[3] * k3),
                  s0.u);
        Y k5 = f (t1,
                  y + h * (c5[0] * k0 + c5[1] * k1 + c5[2] * k2 + c5[3] * k3 + c5[4] * k4),
                  s0.u);

        Y dy = c6[0] * k0 + c6[2] * k2 + c6[3] * k3 + c6[4] * k4 + c6[5] * k5;
        Y y6 = y + h * dy;
        y1   = y6;
        dy1  = f (t1, y6, s0.u);

        Y err = ce[0] * k0 + ce[2] * k2 + ce[3] * k3 + ce[4] * k4 + ce[5] * k5 + ce[6] * dy1;
        // clang-format on

        // std::cerr << "err ="
        // << " " << err.x[0] << " " << err.x[1] << " " << err.x[2] << " " <<
        // err.x[3]
        // << " " << err.p[0] << " " << err.p[1] << " " << err.p[2] << " " <<
        // err.p[3]
        // << "\n";

        // std::cerr << "dy ="
        // << " " << dy.x[0]
        // << " " << dy.x[1]
        // << " " << dy.x[2]
        // << " " << dy.x[3]
        // << " " << dy.p[0]
        // << " " << dy.p[1]
        // << " " << dy.p[2]
        // << " " << dy.p[3]
        // << "\n";
        return error (err, y, dy);
        // return math::rsqrt (hadd (square (err / (atol + rtol * abs (dy)))));
        // return math::rsqrt (hadd (square (h * err / (atol + rtol * abs
        // (y)))));
    }

    static constexpr double ct[7] = {0.,     1. / 5, 3. / 10, 4. / 5,
                                     8. / 9, 1.,     1.};
    static constexpr double c1[1] = {1. / 5};
    static constexpr double c2[2] = {3. / 40, 9. / 40};
    static constexpr double c3[3] = {44. / 45, -56. / 15, 32. / 9};
    static constexpr double c4[4] = {19372. / 6561, -25360. / 2187,
                                     64448. / 6561, -212. / 729};
    static constexpr double c5[5] = {9017. / 3168, -355. / 33, 46732. / 5247,
                                     49. / 176, -5103. / 18656};
    static constexpr double c6[6] = {
        35. / 384, 0, 500. / 1113, 125. / 192, -2187. / 6784, 11. / 84};
    static constexpr double ce[7] = {
        71. / 57600,      0.,        -71. / 16695, 71. / 1920,
        -17253. / 339200, 22. / 525, -1. / 40};

    double h_clamp (double h) const
    {
        if (std::abs (h) < h_min) return std::copysign (h_min, h);
        if (std::abs (h) > h_max) return std::copysign (h_max, h);
        return h;
    }

    static double root4 (double x)
    {
        return double(math::rsqrt (math::rsqrt (float(x))));
    }

    static double poly (math::pack2d x0x1, math::pack2d ab, double c, double x)
    {
        math::pack2d x_x0x1 = math::pack2d{x, x} - x0x1;

        math::pack2d lin = x_x0x1 * ab;
        return double(lin[0] - lin[1] + c * x_x0x1[0] * x_x0x1[1]);
    }

    static double poly0 (double x)
    {
        return poly (math::pack2d{0.35357666015625, 1.000244140625},
                     math::pack2d{1. / (1.000244140625 - 0.35357666015625),
                                  .5 / (1.000244140625 - 0.35357666015625)},
                     -.21, x);
    }

    static double poly1 (double x)
    {
        return poly (math::pack2d{1.000244140625, 2.37890625},
                     math::pack2d{2. / (2.37890625 - 1.000244140625),
                                  1. / (2.37890625 - 1.000244140625)},
                     -.0465, x);
    }

    static double clamp_root56 (double r)
    {
        if (r <= .015625) return .5;
        if (r >= 32.) return 2.;

        r = root4 (r);
        if (r < 1.) return poly0 (r);
        if (r > 1.) return poly1 (r);
        return 1.;
    }
};
