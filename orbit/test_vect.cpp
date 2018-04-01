#include "math.h"

#include <cstdlib>
#include <cstring>
#include <iomanip>
#include <iostream>
#include <random>
#include <typeinfo>

using math::vect3d;
using math::scalar;

int count = 0;

template <typename T> struct printer {
    const T &t;
};
template <typename T> printer<T> print (const T &t) { return {t}; }

template <typename T> std::ostream &operator<< (std::ostream &os, printer<T> p)
{
    return os << p.t;
}
std::ostream &operator<< (std::ostream &os, printer<vect3d> p)
{
    return os                                          //
           << std::setw (4) << double(p.t.x ()) << " " //
           << std::setw (4) << double(p.t.y ()) << " " //
           << std::setw (4) << double(p.t.z ());
}
std::ostream &operator<< (std::ostream &os, printer<vect3d::M> p)
{
    return os << print (vect3d (p.t));
}

std::ostream &operator<< (std::ostream &os, printer<scalar> p)
{
    return os << double(p.t);
}

std::ostream &operator<< (std::ostream &os, printer<scalar::M> p)
{
    return os << double(scalar (p.t));
}

#define W(left, right)                                                         \
    std::setw (std::max (std::strlen (#left), std::strlen (#right)))

#define TEST_EQUAL(left, right)                                                \
    ++count;                                                                   \
    if (!((left) == (right))) {                                                \
        std::cerr << "ERROR: test_vect: " << #left << " == " << #right         \
                  << " failed\n"                                               \
                  << "  sa = " << print (sa) << "\n"                           \
                  << "  sb = " << print (sb) << "\n"                           \
                  << "\n"                                                      \
                  << "  va = " << print (va) << "\n"                           \
                  << "  vb = " << print (vb) << "\n"                           \
                  << "  vc = " << print (vc) << "\n"                           \
                  << "\n"                                                      \
                  << W (left, right) << #left << " = " << print (left) << "\n" \
                  << W (left, right) << #right << " = " << print (right)       \
                  << "\n";                                                     \
                                                                               \
        std::exit (EXIT_FAILURE);                                              \
    }

#define TEST_APPROX(left, right)                                               \
    ++count;                                                                   \
    if (square ((left) - (right)) > 1e-20) {                                   \
        std::cerr << "ERROR: test_vect: " << #left << " ~= " << #right         \
                  << " failed: squared distance = "                            \
                  << print (square ((left) - (right))) << "\n"                 \
                  << "  sa = " << print (sa) << "\n"                           \
                  << "  sb = " << print (sb) << "\n"                           \
                  << "\n"                                                      \
                  << "  va = " << print (va) << "\n"                           \
                  << "  vb = " << print (vb) << "\n"                           \
                  << "  vc = " << print (vc) << "\n"                           \
                  << "\n"                                                      \
                  << W (left, right) << #left << " = " << print (left) << "\n" \
                  << W (left, right) << #right << " = " << print (right)       \
                  << "\n";                                                     \
                                                                               \
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
        S sb = s[1];

        TEST_EQUAL (-v0, v0);
        TEST_EQUAL (-(-va), va);
        TEST_EQUAL (-va, (-s1) * va);

        TEST_EQUAL (v0 + va, va);
        TEST_EQUAL (va + v0, va);
        TEST_EQUAL (va + vb, vb + va);
        TEST_EQUAL ((va + vb) + vc, va + (vb + vc));

        TEST_EQUAL (s0 * va, v0);
        TEST_EQUAL (va * s0, v0);
        TEST_EQUAL (s1 * va, va);
        TEST_EQUAL (va * s1, va);
        TEST_EQUAL (sa * va, va * sa);
        TEST_EQUAL (va * vb, vb * va);
        TEST_EQUAL ((sa * sb) * va, sa * (sb * va));

        TEST_EQUAL (va / s1, va);
        TEST_APPROX ((sa / sb) * va, sa * (va / sb));

        TEST_EQUAL (sa * (va + vb), sa * va + sa * vb);
        TEST_EQUAL (sa * (va + vb) + v0, sa * va + sa * vb);
        TEST_EQUAL (sa * (va + vb) + v0, va * sa + sa * vb);
        TEST_EQUAL (sa * (va + vb) + v0, va * sa + vb * sa);
        TEST_EQUAL (sa * (va + vb) + v0, sa * va + vb * sa);
        TEST_EQUAL (v0 + sa * (va + vb), sa * va + sa * vb);
        TEST_EQUAL (v0 + (va + vb) * sa, sa * va + sa * vb);

        TEST_EQUAL (sa * (va - vb), sa * va - sa * vb);
        TEST_EQUAL (sa * (va - vb) - v0, sa * va - sa * vb);
        TEST_EQUAL (sa * (va - vb) - v0, va * sa - sa * vb);
        TEST_EQUAL (sa * (va - vb) - v0, va * sa - vb * sa);
        TEST_EQUAL (sa * (va - vb) - v0, sa * va - vb * sa);
        TEST_EQUAL (v0 - sa * (va - vb), sa * vb - sa * va);
        TEST_EQUAL (v0 - (va - vb) * sa, sa * vb - sa * va);

        TEST_EQUAL (va - vb, va + (-vb));
        TEST_EQUAL (va - vb, -(vb - va));

        TEST_EQUAL (v0 * va, s0);
        TEST_EQUAL (va * v0, s0);
        TEST_EQUAL (va * vb, vb * va);
        TEST_EQUAL (va * (-vb), -(va * vb));
        TEST_EQUAL (vx * vy, s0);
        TEST_EQUAL (vy * vz, s0);
        TEST_EQUAL (vz * vx, s0);
        TEST_EQUAL ((sa * va) * vb, sa * (va * vb));
        TEST_EQUAL (square (va), va * va);

        TEST_EQUAL (v0 ^ va, v0);
        TEST_EQUAL (va ^ v0, v0);
        TEST_EQUAL (va ^ (-vb), -(va ^ vb));
        TEST_EQUAL ((va ^ vb), -(vb ^ va));
        TEST_EQUAL (vx ^ vy, vz);
        TEST_EQUAL (vy ^ vz, vx);
        TEST_EQUAL (vz ^ vx, vy);
        TEST_EQUAL ((sa * va) ^ vb, sa * (va ^ vb));

        TEST_EQUAL (va ^ (vb + vc), (va ^ vb) + (va ^ vc));
        TEST_EQUAL (va ^ (vb - vc), (va ^ vb) - (va ^ vc));

        TEST_EQUAL (vx * vx, s1);
        TEST_EQUAL (vy * vy, s1);
        TEST_EQUAL (vz * vz, s1);
        TEST_EQUAL ((vx + vy) * (vx + vy), s1 + s1);
        TEST_EQUAL ((vx - vy) * (vx + vy), s0);
        TEST_EQUAL ((vx - vy) * (vx - vy), s1 + s1);
        TEST_EQUAL ((vx + vy + vz) * (vx + vy + vz), s1 + s1 + s1);
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

    {
        unsigned i = 0;
        v[i++]     = v0;
        v[i++]     = vx;
        v[i++]     = vy;
        v[i++]     = vz;

        for (; i < size; ++i) {
            double x = double(dist (engine));
            double y = double(dist (engine));
            double z = double(dist (engine));
            v[i]     = vect3d{x, y, z};
            d[i]     = double(dist (engine));
            s[i]     = d[i];
        }

        i      = 0;
        d[i]   = 0;
        s[i++] = 0;
        d[i]   = 1;
        s[i++] = 1;
        for (; i < size; ++i) {
            d[i] = double(dist (engine));
            s[i] = d[i];
        }
    }

    for (unsigned i = 0; i <= size - max_operands; ++i) {
        test<double> (v + i, d + i);
        test<scalar> (v + i, s + i);
    }

    std::cout << count << " tests passed.\n";
}
