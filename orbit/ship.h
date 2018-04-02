#pragma once

#include "math.h"

namespace ship
{
struct simple_state : math::pack_operators<simple_state> {
    MATH_PACK_OPERATORS_DECLARE (simple_state,      //
                                 math::pack4d, r_0, //
                                 math::pack4d, v_m)
    simple_state (math::vect3d r, math::vect3d v, double m)
        : simple_state{r, v, math::scalar{m}}
    {
    }

    simple_state (math::vect3d r, math::vect3d v, math::scalar m)
        : r_0{r}
        , v_m{pack (v, m)}
    {
    }

    math::vect3d r () const { return math::vect3d{r_0}; }
    math::vect3d v () const { return math::vect3d{v_m}; }
    math::scalar m () const { return v_m[3]; }

    void set_m (math::scalar m1) { v_m[3] = m1; }

    static math::pack4d pack (math::vect3d v, math::scalar m)
    {
        math::v4d a{v};
        a[3] = double(m);
        return a;
    }
};

struct state : math::pack_operators<state> {
    MATH_PACK_OPERATORS_DECLARE (state, simple_state, x, simple_state, p)
};

struct deriv {

    double thrust    = 1.;
    double mass_rate = 1.;

    state operator() (math::scalar /*t*/, const state &y, double throttle) const
    {

        using math::scalar;
        using math::vect3d;

        scalar r2 = square (y.x.r ());
        scalar r  = sqrt (r2);
        scalar r3 = r * r2;

        vect3d dxr = y.x.v ();
        vect3d dxv = -y.x.r () / r3;
        scalar dxm = 0;

        scalar r5 = r3 * r2;
        vect3d dpr =
            (r2 * y.p.v () - (3. * (y.p.v () * y.x.r ())) * y.x.r ()) / r5;
        vect3d dpv = -y.p.r ();
        scalar dpm = 0;

        if (throttle > 0) {
            std::cerr << "throttle " << throttle << "!\n";
            scalar pv  = sqrt (square (y.p.v ()));
            vect3d pv_ = y.p.v () / pv;

            dxv += thrust * throttle / y.x.m () * pv_;
            dxm -= throttle * mass_rate;

            dpm -= pv * thrust / square (y.x.m ()) * throttle;
        }

        return {{dxr, dxv, dxm}, {dpr, dpv, dpm}};
    };

    double swich (const state &y) const
    {
        math::scalar pv = sqrt (square (y.p.v ()));

        return double(pv / y.x.m () - mass_rate / thrust * y.p.m ());
    }

    double d_swich (const state &y) const
    {
        return double{-y.p.r () * y.p.v ()};
    }

    double pm_for_swich (const state &y, double swich) const
    {
        math::scalar pv = sqrt (square (y.p.v ()));

        return double((pv / y.x.m () - swich) * thrust / mass_rate);
    }
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

    struct norm : math::pack_operators<norm> {
        MATH_PACK_OPERATORS_DECLARE (norm, math::pack4d, rv, math::pack2d, m)

        norm (const state &y)
            : rv{compute_rv (y)}
            , m{compute_m (y)}
        {
        }

        static math::pack4d compute_rv (const state &y)
        {
            return sqrt (math::pack4d{y.x.r () * y.x.r (), y.x.v () * y.x.v (),
                                      y.p.r () * y.p.r (),
                                      y.p.v () * y.p.v ()});
        }
        static math::pack2d compute_m (const state &y)
        {
            return sqrt (math::pack2d{y.x.m (), y.p.m ()});
        }
    };

    double operator() (const state &err, const state & /*y*/,
                       const state &dy) const
    {
        return hmin (abs ((atol + rtol * norm (dy)) / norm (err)));
        // return rsqrt (hadd (square (norm (err) / (atol + rtol * norm
        // (dy)))));
    }
};
}

struct vship {
    typedef ::ship::state state;
    typedef ::ship::deriv deriv;
    typedef ::ship::error error;

    deriv f;
    error e;
};

// using ship::ship;
