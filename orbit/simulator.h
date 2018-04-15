#include "dopri5.h"
#include "root.h"

template <typename ship> struct simulator {

    typedef typename ship::state ship_state;

    struct state {
        ship_state y;
        ship_state dy;
        double t;

        void set (double t1, const ship_state &y1, const ship_state &dy1)
        {
            t  = t1;
            y  = y1;
            dy = dy1;
        }

        double t_next;
        double u;

        double swich;
        double d_swich;
    };

    simulator (const ship &s)
        : ode{s.f, s.e}
        , root{1e-7}
        , force_throttle{false}
    {
    }

    simulator (const ship &s, const ship_state &y0, double t0, double tf)
        : simulator{s}
    {
        init (y0, t0, tf);
    }

    simulator (const ship &s, const ship_state &y0, double t0, double tf,
               double u)
        : ode{s.f, s.e}
        , root{1e-7}
        , force_throttle{true}
    {
        ode.init (s0, y0, t0, tf, u);
        update (s0, u);
        set_t_final (tf);
        ode_step (s1, s0);

        adjust (s0, s1);
    }

    void init (const ship_state &y0, double t0, double tf)
    {
        ode.init (s0, y0, t0, tf, 0.);
        update (s0, 0.);
        if (s0.u != 0.) {
            ode.init (s0, y0, t0, tf, s0.u);
            update (s0, s0.u);
        }
        // s1.u = s0.u;
        set_t_final (tf);
        ode_step (s1, s0);

        adjust (s0, s1);
    }

    ship_state pm_for_swich (const ship_state &y0, double swich)
    {
        ship_state y = y0;
        y.p.set_m (ode.f.pm_for_swich (y0, swich));
        return y;
    }

    void set_t_final (double tf) { ode.t_final = tf; }

    operator bool () const { return s0.t != ode.t_final; }

    const state &operator* () const { return s0; }
    const state *operator-> () const { return &s0; }

    simulator &operator++ ()
    {
        ode_step (s2, s1);

        if (math::abs (s0.swich) > swich_epsilon     //
            || math::abs (s1.swich) > swich_epsilon  //
            || math::abs (s2.swich) > swich_epsilon) //
        {
            adjust (s1, s2);
        }

        s1 = s2;
        s0 = s1;

        return *this;
    }

    double swich_epsilon = 1e-9;

  private:
    typedef typename ship::deriv deriv;
    typedef typename ship::error error;

    dopri5<deriv, error> ode;
    root root;
    bool force_throttle;

    state s0;
    state s1;
    state s2;

    void adjust (state &sa, state &sb)
    {
        adjust (sa, sb, &state::d_swich);
        adjust (sa, sb, &state::swich);
        if (sb.u != sa.u) {
            std::cerr << "throttle change: re evaluating derivative\n";
            sb.dy = ode.f (sb.t, sb.y, sb.u);
        }
    }

    void adjust (state &sa, state &sb, double state::*k)
    {
        if (math::sign (sa.*k) * math::sign (sb.*k) >= 0.) return;

        double h = sb.t - sa.t;

        double t1 = root (sa.t, sb.t,
                          [this, &sa, k](double t) {
                              state s;
                              this->ode_step (s, sa, t);
                              return s.*k;
                          },
                          sa.*k, sb.*k);

        if (t1 <= sa.t || t1 >= sb.t) return;

        ode_step (sb, sa, t1);
        sb.*k     = 0.;
        sb.t_next = sb.t + h;
    }

    void ode_step (state &sb, state &sa)
    {
        ode.step (sb, sa);
        update (sb, sa.u);
        if (sb.swich > swich_epsilon && sa.u == 0.) {
            sa.u = 1.;
            std::cerr << "retrying u = 1 at t = " << sa.t << "\n";
            sa.dy = ode.f (sa.t, sa.y, sa.u);
            ode.step (sb, sa);
            update (sb, sa.u);
        } else if (sb.swich < swich_epsilon && sa.u == 1.) {
            sa.u = 0.;
            std::cerr << "retrying u = 0 at t = " << sa.t << "\n";
            sa.dy = ode.f (sa.t, sa.y, sa.u);
            ode.step (sb, sa);
            update (sb, sa.u);
        }
    }
    void ode_step (state &sb, state &sa, double tb)
    {
        ode.force_step (sb, sa, tb);
        update (sb, sa.u);
        if (sb.swich > swich_epsilon && sa.u == 0.) {
            sa.u = 1.;
            std::cerr << "retrying u = 1 at t = " << sa.t << "\n";
            sa.dy = ode.f (sa.t, sa.y, sa.u);
            ode.force_step (sb, sa, tb);
            update (sb, sa.u);
        } else if (sb.swich < swich_epsilon && sa.u == 1.) {
            sa.u = 0.;
            std::cerr << "retrying u = 0 at t = " << sa.t << "\n";
            sa.dy = ode.f (sa.t, sa.y, sa.u);
            ode.force_step (sb, sa, tb);
            update (sb, sa.u);
        }
    }

    void update (state &sb, double u)
    {
        sb.swich   = ode.f.swich (sb.y);
        sb.d_swich = ode.f.d_swich (sb.y);

        if (force_throttle)
            sb.u = u;
        else if (sb.swich > swich_epsilon)
            sb.u = 1.;
        else if (sb.swich < -swich_epsilon)
            sb.u = 0.;
        else if (sb.d_swich > 0)
            sb.u = 1.;
        else if (sb.d_swich < 0)
            sb.u = 0.;
        else {
            std::cerr << "warning: guessing thottle " << u << " at t = " << sb.t
                      << "\n";
            sb.u = u;
        }
    }
};
