#pragma once

#include "math.h"

namespace ship
{
struct simple_state : math::pack_operators<simple_state> {
    MATH_PACK_OPERATORS_DECLARE (simple_state,      //
                                 math::pack4d, r_0, //
                                 math::pack4d, v_m)

    math::vect3d r () { return r_0; }
    math::vect3d v () { return v_m; }
    math::scalar m () { return v_m[3]; }
};

struct state : math::pack_operators<state> {
    MATH_PACK_OPERATORS_DECLARE (state, simple_state, x, simple_state, p)
};

struct deriv {

    double thrust;
    double mass_rate;

    state operator() (double t, const state &y, double throttle) { return y; }
};

struct error {

    double rtol;
    double atol;

    error (double rtol = 1e-7)
        : error{rtol, rtol * 1e-2}
    {
    }
    error (double rtol, double atol)
        : rtol{rtol}
        , atol{atol}
    {
    }

    struct norm : math::pack_operator<norm> {
        MATH_PACK_OPERATORS_DECLARE (norm, math::pack4d, rv, math::pack2d, m)

        norm (const state &y)
            : rv{compute_rv (y)}
            , m{compute_m (y)}
        {
        }

        static pack4d compute_rv (const Y &y)
        {
            return sqrt (pack4d{y.x.r () * y.x.r (), y.x.v () * y.x.v (),
                                y.p.r () * y.p.r (), y.p.v () * y.p.v ()});
        }
        static pack2d compute_m (const Y &y)
        {
            return sqrt (pack2d{y.x.m (), y.p.m ()});
        }
    };

    double operator() (const state &err, const state &y, const state &dy)
    {
        return hmin (abs ((atol + rtol * norm (dy)) / norm (err)));
        // return rsqrt (hadd (square (norm (err) / (atol + rtol * norm
        // (dy)))));
    }
};

struct ship {
    typedef state state;
    typedef deriv deriv;
    typedef error error;

    deriv f;
    error e;
};
}

using ship::ship;
