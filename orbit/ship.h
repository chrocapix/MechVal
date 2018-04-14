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

    void set_m (math::scalar m1)
    {
        std::cerr << "set_m " << double(m1) << "\n";
        v_m = pack (v (), m1);
        std::cerr << "set_m v_m[3] " << double(v_m[3]) << "\n";
        std::cerr << "set_m m() " << double(m ()) << "\n";
    }

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
    double mass_rate = 8.;

    state operator() (math::scalar, const state &y, double throttle) const
    {
        // std::cerr << "f (" << double(t) << " " << throttle << ")\n";

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
            // std::cerr << "throttle " << throttle << " thrust " << thrust
            // << " mass_rate " << mass_rate << "\n";
            scalar pv  = sqrt (square (y.p.v ()));
            vect3d pv_ = y.p.v () / pv;

            // std::cerr << "pv_ " << double(pv_.x ()) << " " << double(pv_.y
            // ())
            // << " " << double(pv_.z ()) << "\n";
            // std::cerr << " pv " << double(y.p.v ().x ()) << " "
            // << double(y.p.v ().y ()) << " " << double(y.p.v ().z ())
            // << "\n";

            dxv += thrust * throttle / y.x.m () * pv_;
            // std::cerr << "dv " << double(dxv.x ()) << " " << double(dxv.y ())
            // << " " << double(dxv.z ()) << "\n";
            dxm -= throttle * mass_rate;
            // std::cerr << "dm " << double(dxm) << "\n";

            dpm += pv * thrust / square (y.x.m ()) * throttle;
            // std::cerr << "dpm " << double(dpm) << "\n";
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
            return sqrt (abs (math::pack2d{y.x.m (), y.p.m ()}));
        }
    };

    double operator() (const state &err, const state & /*y*/,
                       const state &dy) const
    {
#if 0
        norm n_dy{dy}, n_err{err};

        std::cerr << "norm  dy rv "            //
                  << double(n_dy.rv[0]) << " " //
                  << double(n_dy.rv[1]) << " " //
                  << double(n_dy.rv[2]) << " " //
                  << double(n_dy.rv[3]) << "\n"
                  << "          m "           //
                  << double(n_dy.m[0]) << " " //
                  << double(n_dy.m[1]) << "\n";
        std::cerr << "norm err rv "             //
                  << double(n_err.rv[0]) << " " //
                  << double(n_err.rv[1]) << " " //
                  << double(n_err.rv[2]) << " " //
                  << double(n_err.rv[3]) << "\n"
                  << "          m "            //
                  << double(n_err.m[0]) << " " //
                  << double(n_err.m[1]) << "\n";

        std::cout << "dy / err " << hmin (norm (dy) / norm (err)) << "\n";
#endif

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
