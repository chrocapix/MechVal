#include "dopri5.h"

template <typename ship> struct simulator {

    typedef typename ship::state ship_state;

    struct state {
        ship_state y;
        ship_state dy;
        double t;
        double t_next;
        double u;
    };

    template <typename Control>
    simulator (const ship &s, const ship_state &y0, double t0, double tf,
               const Control &u)
        : ode{s.f, s.e}
    {
        ode.init (curr, y0, t0, tf, u);
    }

    operator bool () const { return curr.t == ode.t_final; }

    const state &operator* () { return curr; }
    const state *operator-> () { return &curr; }

    simulator &operator++ ()
    {
        ode.step (curr, curr);

        return *this;
    }

  private:
    typedef typename ship::deriv deriv;
    typedef typename ship::error error;

    dopri5<deriv, error> ode;
    state curr;
};
