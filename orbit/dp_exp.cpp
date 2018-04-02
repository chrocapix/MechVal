
#include "dopri5.h"
#include <iostream>

#include <util/getarg.h>

using math::scalar;

struct state {
    double t;
    scalar y;
    scalar dy;
    void set (double t1, scalar y1, scalar dy1)
    {
        t  = t1;
        y  = y1;
        dy = dy1;
    }
    double t_next;
    bool u;
};

struct f {
    scalar operator() (scalar, scalar y, bool) const { return y; }
};

int main (int, char *argv[])
{

    double y0, tf;

    getarg (argv[1], y0);
    getarg (argv[2], tf);

    dopri5<f> dp{f (), {0.0000001}};

    state s;
    dp.init (s, y0, 0, 1, false);
    // double h0 = dp.h_init (s, tf, false);
    // std::cerr << "h0 = " << h0 << "\n";
    // s.t_next = s.t + h0;

    dp.t_final = tf;
    std::cout << s.t << " " << double(s.y) << "\n";
    while (s.t < dp.t_final) {
        dp.step (s, s);
        std::cout << s.t << " " << double(s.y) << " " << s.t_next - s.t << "\n";
    }
}
