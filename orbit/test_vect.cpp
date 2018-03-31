#include "math.h"

#include <cstdlib>
#include <iostream>
#include <random>
#include <typeinfo>

using math::vect3d;
using math::scalar;

int count = 0;

#define CHECK(expr)                                                            \
    ++count;                                                                   \
    if (!(expr)) {                                                             \
        std::cerr << #expr << " failed for scalar type " << typeid (S).name () \
                  << "\n";                                                     \
        std::exit (EXIT_FAILURE);                                              \
    }

vect3d v0{0};
vect3d vx{1, 0, 0};
vect3d vy{0, 1, 0};
vect3d vz{0, 0, 1};

template <typename S> struct tests {
    S s0 = 0;
    S s1 = 1;

    void operator() (const vect3d *v, const S *s)
    {
        vect3d va = v[0];
        vect3d vb = v[1];
        vect3d vc = v[2];

        S sa = s[0];
        // S sb = s[1];

        CHECK (v0 + va == va);
        CHECK (va + v0 == va);
        CHECK (va + vb == vb + va);
        CHECK ((va + vb) + vc == va + (vb + vc));

        CHECK (s0 * va == v0);
        CHECK (va * s0 == v0);

        CHECK (s1 * va == va);
        CHECK (va * s1 == va);

        CHECK (sa * v0 == v0);
        CHECK (v0 * sa == v0);

        CHECK (sa * va == va * sa);
        CHECK (va * vb == vb * va);
        CHECK ((va ^ vb) == -(vb ^ va));
        CHECK (sa * (va + vb) == sa * va + sa * vb);
    }
};

template <typename S> void test (const vect3d *v, const S *s)
{
    tests<S> () (v, s);
}

int main ()
{
    std::default_random_engine engine{42};
    std::uniform_int_distribution<int> dist{-10, 10};

    const unsigned size         = 40;
    const unsigned max_operands = 4;
    vect3d v[size];
    double d[size];
    scalar s[size];

    for (unsigned i = 0; i < size; ++i) {
        double x = double(dist (engine));
        double y = double(dist (engine));
        double z = double(dist (engine));
        v[i]     = vect3d{x, y, z};
        d[i]     = double(dist (engine));
        s[i]     = d[i];
    }
    for (unsigned i = 0; i <= size - max_operands; ++i) {
        test<double> (v + i, d + i);
        test<scalar> (v + i, s + i);
    }

    std::cout << count << " tests passed.\n";
}
