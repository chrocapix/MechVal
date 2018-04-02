#include "dopri5.h"

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

    template <typename Control>
    simulator (const ship &s, const ship_state &y0, double t0, double tf,
               const Control &u)
        : ode{s.f, s.e}
    {
        ode.init (curr, y0, t0, tf, u);
        curr.swich   = ode.f.swich (curr.y);
        curr.d_swich = ode.f.d_swich (curr.y);
    }

    void set_t_final (double tf) { ode.t_final = tf; }

    operator bool () const { return curr.t != ode.t_final; }

    const state &operator* () const { return curr; }
    const state *operator-> () const { return &curr; }

    simulator &operator++ ()
    {
        ode_step (curr, curr);

        return *this;
    }

  private:
    typedef typename ship::deriv deriv;
    typedef typename ship::error error;

    dopri5<deriv, error> ode;
    state curr;

    void ode_step (state &s1, const state &s0)
    {
        ode.step (s1, s0);
        s1.swich   = ode.f.swich (s1.y);
        s1.d_swich = ode.f.d_swich (s1.y);
    }
};
