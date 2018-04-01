#include "math.h"

#include <cstdlib>
#include <iomanip>
#include <iostream>
#include <random>
#include <typeinfo>
#include <x86intrin.h>

template <typename P> struct layout {
    static int i[1];

    typedef union {
        P p;
        double d[1];
    } u;
};

using math::scalar;
using math::pack2d;
using math::pack4d;

using math::rsqrt;

using math::min;
using math::max;

double square (double a) { return a * a; }

struct X : math::pack_operators<X> {
    MATH_PACK_OPERATORS_DECLARE (X, pack4d, r, pack4d, v)
};
template <> struct layout<X> {
    static int i[8];

    typedef union {
        X p;
        double d[8];
    } u;
};
int layout<X>::i[8] = {0, 1, 2, 3, 4, 5, 6, 7};

struct Y : math::pack_operators<Y> {
    MATH_PACK_OPERATORS_DECLARE (Y, X, x, X, p)
};
template <> struct layout<Y> {
    static int i[16];

    typedef union {
        Y p;
        double d[16];
    } u;
};
int layout<Y>::i[16] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};

struct N : math::pack_operators<N> {
    MATH_PACK_OPERATORS_DECLARE (N, pack4d, rv, pack2d, m)
};
template <> struct layout<N> {
    static int i[6];

    typedef union {
        N p;
        double d[6];
    } u;
};
int layout<N>::i[6] = {0, 1, 2, 3, 4, 5};

template <> int layout<scalar>::i[1] = {0};
template <> int layout<double>::i[1] = {0};
// int layout<double>::i[1] = { 0 };

template <> struct layout<pack4d> {
    static int i[4];

    typedef union {
        pack4d p;
        double d[4];
    } u;
};
int layout<pack4d>::i[4] = {0, 1, 2, 3};
template <> struct layout<pack2d> {
    static int i[2];

    typedef union {
        pack2d p;
        double d[2];
    } u;
};
int layout<pack2d>::i[2] = {0, 1};

template <typename T> struct printer {
    const T &t;
};
template <typename T> printer<T> print (const T &t) { return {t}; }
template <typename T> std::ostream &operator<< (std::ostream &os, printer<T> p)
{
    typedef layout<T> layout;
    typedef typename layout::u u;

    u up;
    up.p = p.t;

    for (int i : layout::i) os << std::setw (4) << up.d[i];
    return os;
}

template <typename T> double test_hmin (const T &a)
{
    typedef layout<T> layout;
    typedef typename layout::u u;

    u up;
    up.p = a;

    double m                  = up.d[layout::i[0]];
    for (int i : layout::i) m = std::min (m, up.d[i]);
    return m;
}

template <typename T> double test_hmax (const T &a)
{
    typedef layout<T> layout;
    typedef typename layout::u u;

    u up;
    up.p = a;

    double m                  = up.d[layout::i[0]];
    for (int i : layout::i) m = std::max (m, up.d[i]);
    return m;
}

template <typename T> double test_hadd (const T &a)
{
    typedef layout<T> layout;
    typedef typename layout::u u;

    u up;
    up.p = a;

    double m = 0;
    for (int i : layout::i) m += up.d[i];
    return m;
}

int count = 0;

bool is_nan (double x) { return x != x; }
bool are_equal_or_nan (double a, double b)
{
    return a == b || (is_nan (a) && is_nan (b));
}

bool bad (double expected, double actual)
{
    return !are_equal_or_nan (expected, actual);
}

#define TEST1_DEFS(adefs, edefs, expr)                                         \
    {                                                                          \
        u u0;                                                                  \
        u0.p = data[0];                                                        \
                                                                               \
        adefs                                                                  \
                                                                               \
            u actual;                                                          \
        actual.p = expr;                                                       \
                                                                               \
        for (int i : layout::i) {                                              \
            S expected;                                                        \
            {                                                                  \
                edefs expected = expr;                                         \
            }                                                                  \
                                                                               \
            if (bad (double(expected), actual.d[i])) {                         \
                std::cerr << "ERROR test_pack:\n"                              \
                          << typeid (a).name () << " a;\n"                     \
                          << "a " << print (a) << "\n"                         \
                          << "= " << print (actual.p) << "\n"                  \
                          << #expr << ": at index " << i << ", expected "      \
                          << double(expected) << ", got " << actual.d[i]       \
                          << "\n";                                             \
                std::exit (EXIT_FAILURE);                                      \
            }                                                                  \
        }                                                                      \
        ++count;                                                               \
    }

#define TEST1_P(expr) TEST1_DEFS (P a = u0.p;, S a = u0.d[i];, expr)
#define TEST1(expr) TEST1_P (expr)

#define TEST2_DEFS(adefs, edefs, expr)                                         \
    {                                                                          \
        u u0;                                                                  \
        u0.p = data[0];                                                        \
        u u1;                                                                  \
        u1.p = data[1];                                                        \
                                                                               \
        adefs                                                                  \
                                                                               \
            u actual;                                                          \
        actual.p = (expr);                                                     \
                                                                               \
        for (int i : layout::i) {                                              \
            S expected;                                                        \
            {                                                                  \
                edefs expected = (expr);                                       \
            }                                                                  \
                                                                               \
            if (bad (double(expected), actual.d[i])) {                         \
                std::cerr << "ERROR test_pack:\n"                              \
                          << typeid (a).name () << " a;\n"                     \
                          << typeid (b).name () << " b;\n"                     \
                          << "a " << print (a) << "\n"                         \
                          << "b " << print (b) << "\n"                         \
                          << "= " << print (actual.p) << "\n"                  \
                          << #expr << ": at index " << i << ", expected "      \
                          << double(expected) << ", got " << actual.d[i]       \
                          << "\n";                                             \
                std::exit (EXIT_FAILURE);                                      \
            }                                                                  \
        }                                                                      \
        ++count;                                                               \
    }

#define TEST2_PP(expr)                                                         \
    TEST2_DEFS (P a = u0.p; P b = u1.p;, S a = u0.d[i]; S b = u1.d[i];, expr)
#define TEST2_SP(expr)                                                         \
    TEST2_DEFS (S a = u0.d[0]; P b = u1.p;, S b = u1.d[i];, expr)
#define TEST2_PS(expr)                                                         \
    TEST2_DEFS (P a = u0.p; S b = u1.d[0];, S a = u0.d[i];, expr)
#define TEST2(expr)                                                            \
    TEST2_PP (expr)                                                            \
    TEST2_SP (expr)                                                            \
    TEST2_PS (expr)

#define TEST2_(expr)                                                           \
    TEST2_PP (expr)                                                            \
    TEST2_PS (expr)

#define TEST3_DEFS(adefs, edefs, expr)                                         \
    {                                                                          \
        u u1;                                                                  \
        u1.p = data[0];                                                        \
        u u2;                                                                  \
        u2.p = data[1];                                                        \
        u u3;                                                                  \
        u3.p = data[2];                                                        \
                                                                               \
        adefs                                                                  \
                                                                               \
            u actual;                                                          \
        asm("# TEST3 " #expr " -- " #adefs);                                   \
        actual.p = (expr);                                                     \
                                                                               \
        for (int i : layout::i) {                                              \
            S expected;                                                        \
            {                                                                  \
                edefs expected = (expr);                                       \
            }                                                                  \
                                                                               \
            if (bad (double(expected), actual.d[i])) {                         \
                std::cerr << "ERROR test_pack:\n"                              \
                          << typeid (a).name () << " a;\n"                     \
                          << typeid (b).name () << " b;\n"                     \
                          << typeid (c).name () << " c;\n"                     \
                          << "a " << print (a) << "\n"                         \
                          << "b " << print (b) << "\n"                         \
                          << "c " << print (c) << "\n"                         \
                          << "= " << print (actual.p) << "\n"                  \
                          << #expr << ": at index " << i << ", expected "      \
                          << double(expected) << ", got " << actual.d[i]       \
                          << "\n";                                             \
                std::exit (EXIT_FAILURE);                                      \
            }                                                                  \
        }                                                                      \
        ++count;                                                               \
    }

#define TEST3_PSS(expr)                                                        \
    TEST3_DEFS (P a = u1.p; S b = u2.d[0]; S c = u3.d[0];, S a = u1.d[i];, expr)
#define TEST3_SPS(expr)                                                        \
    TEST3_DEFS (S a = u1.d[0]; P b = u2.p; S c = u3.d[0];, S b = u2.d[i];, expr)
#define TEST3_PPS(expr)                                                        \
    TEST3_DEFS (P a = u1.p; P b = u2.p; S c = u3.d[0];, S a = u1.d[i];         \
                S b = u2.d[i];, expr)
#define TEST3_SSP(expr)                                                        \
    TEST3_DEFS (S a = u1.d[0]; S b = u2.d[0]; P c = u3.p;, S c = u3.d[i];, expr)
#define TEST3_PSP(expr)                                                        \
    TEST3_DEFS (P a = u1.p; S b = u2.d[0]; P c = u3.p;, S a = u1.d[i];         \
                S c = u3.d[i];, expr)
#define TEST3_SPP(expr)                                                        \
    TEST3_DEFS (S a = u1.d[0]; P b = u2.p; P c = u3.p;, S b = u2.d[i];         \
                S c = u3.d[i];, expr)
#define TEST3_PPP(expr)                                                        \
    TEST3_DEFS (P a = u1.p; P b = u2.p; P c = u3.p;, S a = u1.d[i];            \
                S b = u2.d[i]; S c = u3.d[i];, expr)
#define TEST3(expr)                                                            \
    TEST3_PSS (expr)                                                           \
    TEST3_SPS (expr)                                                           \
    TEST3_PPS (expr)                                                           \
    TEST3_SSP (expr)                                                           \
    TEST3_PSP (expr)                                                           \
    TEST3_SPP (expr)                                                           \
    TEST3_PPP (expr)

#define TEST3_(expr)                                                           \
    TEST3_PSS (expr)                                                           \
    TEST3_PPS (expr)                                                           \
    TEST3_PSP (expr)                                                           \
    TEST3_PPP (expr)

#define TEST4_DEFS(adefs, edefs, expr)                                         \
    {                                                                          \
        u u1;                                                                  \
        u1.p = data[0];                                                        \
        u u2;                                                                  \
        u2.p = data[1];                                                        \
        u u3;                                                                  \
        u3.p = data[2];                                                        \
        u u4;                                                                  \
        u4.p = data[3];                                                        \
                                                                               \
        adefs                                                                  \
                                                                               \
            u actual;                                                          \
        actual.p = (expr);                                                     \
                                                                               \
        for (int i : layout::i) {                                              \
            S expected;                                                        \
            {                                                                  \
                edefs expected = (expr);                                       \
            }                                                                  \
                                                                               \
            if (bad (double(expected), actual.d[i])) {                         \
                std::cerr << "ERROR test_pack:\n"                              \
                          << typeid (a).name () << " a;\n"                     \
                          << typeid (b).name () << " b;\n"                     \
                          << typeid (c).name () << " c;\n"                     \
                          << typeid (d).name () << " d;\n"                     \
                          << "a " << print (a) << "\n"                         \
                          << "b " << print (b) << "\n"                         \
                          << "c " << print (c) << "\n"                         \
                          << "d " << print (d) << "\n"                         \
                          << "= " << print (actual.p) << "\n"                  \
                          << #expr << ": at index " << i << ", expected "      \
                          << double(expected) << ", got " << actual.d[i]       \
                          << "\n";                                             \
                std::exit (EXIT_FAILURE);                                      \
            }                                                                  \
        }                                                                      \
        ++count;                                                               \
    }

#define TEST4_PSSS(expr)                                                       \
    TEST4_DEFS (P a = u1.p; S b = u2.d[0]; S c = u3.d[0]; S d = u4.d[0];       \
                , S a = u1.d[i];, expr)
#define TEST4_SPSS(expr)                                                       \
    TEST4_DEFS (S a = u1.d[0]; P b = u2.p; S c = u3.d[0]; S d = u4.d[0];       \
                , S b = u2.d[i];, expr)
#define TEST4_PPSS(expr)                                                       \
    TEST4_DEFS (P a = u1.p; P b = u2.p; S c = u3.d[0]; S d = u4.d[0];          \
                , S a = u1.d[i]; S b = u2.d[i];, expr)
#define TEST4_SSPS(expr)                                                       \
    TEST4_DEFS (S a = u1.d[0]; S b = u2.d[0]; P c = u3.p; S d = u4.d[0];       \
                , S c = u3.d[i];, expr)
#define TEST4_PSPS(expr)                                                       \
    TEST4_DEFS (P a = u1.p; S b = u2.d[0]; P c = u3.p; S d = u4.d[0];          \
                , S a = u1.d[i]; S c = u3.d[i];, expr)
#define TEST4_SPPS(expr)                                                       \
    TEST4_DEFS (S a = u1.d[0]; P b = u2.p; P c = u3.p; S d = u4.d[0];          \
                , S b = u2.d[i]; S c = u3.d[i];, expr)
#define TEST4_PPPS(expr)                                                       \
    TEST4_DEFS (P a = u1.p; P b = u2.p; P c = u3.p; S d = u4.d[0];             \
                , S a = u1.d[i]; S b = u2.d[i]; S c = u3.d[i];, expr)
#define TEST4_SSSP(expr)                                                       \
    TEST4_DEFS (S a = u1.d[0]; S b = u2.d[0]; S c = u3.d[0]; P d = u4.p;       \
                , S d = u4.d[i];, expr)
#define TEST4_PSSP(expr)                                                       \
    TEST4_DEFS (P a = u1.p; S b = u2.d[0]; S c = u3.d[0]; P d = u4.p;          \
                , S a = u1.d[i]; S d = u4.d[i];, expr)
#define TEST4_SPSP(expr)                                                       \
    TEST4_DEFS (S a = u1.d[0]; P b = u2.p; S c = u3.d[0]; P d = u4.p;          \
                , S b = u2.d[i]; S d = u4.d[i];, expr)
#define TEST4_PPSP(expr)                                                       \
    TEST4_DEFS (P a = u1.p; P b = u2.p; S c = u3.d[0]; P d = u4.p;             \
                , S a = u1.d[i]; S b = u2.d[i]; S d = u4.d[i];, expr)
#define TEST4_SSPP(expr)                                                       \
    TEST4_DEFS (S a = u1.d[0]; S b = u2.d[0]; P c = u3.p; P d = u4.p;          \
                , S c = u3.d[i]; S d = u4.d[i];, expr)
#define TEST4_PSPP(expr)                                                       \
    TEST4_DEFS (P a = u1.p; S b = u2.d[0]; P c = u3.p; P d = u4.p;             \
                , S a = u1.d[i]; S c = u3.d[i]; S d = u4.d[i];, expr)
#define TEST4_SPPP(expr)                                                       \
    TEST4_DEFS (S a = u1.d[0]; P b = u2.p; P c = u3.p; P d = u4.p;             \
                , S b = u2.d[i]; S c = u3.d[i]; S d = u4.d[i];, expr)
#define TEST4_PPPP(expr)                                                       \
    TEST4_DEFS (P a = u1.p; P b = u2.p; P c = u3.p; P d = u4.p;                \
                , S a = u1.d[i]; S b = u2.d[i]; S c = u3.d[i]; S d = u4.d[i];  \
                , expr)
#define TEST4(expr)                                                            \
    TEST4_PSSS (expr)                                                          \
    TEST4_SPSS (expr)                                                          \
    TEST4_PPSS (expr)                                                          \
    TEST4_SSPS (expr)                                                          \
    TEST4_PSPS (expr)                                                          \
    TEST4_SPPS (expr)                                                          \
    TEST4_PPPS (expr)                                                          \
    TEST4_SSSP (expr)                                                          \
    TEST4_PSSP (expr)                                                          \
    TEST4_SPSP (expr)                                                          \
    TEST4_PPSP (expr)                                                          \
    TEST4_SSPP (expr)                                                          \
    TEST4_PSPP (expr)                                                          \
    TEST4_SPPP (expr)                                                          \
    TEST4_PPPP (expr)

#define TEST4_(expr)                                                           \
    TEST4_PSSS (expr)                                                          \
    TEST4_PPSS (expr)                                                          \
    TEST4_PSPS (expr)                                                          \
    TEST4_PPPS (expr)                                                          \
    TEST4_PSSP (expr)                                                          \
    TEST4_PPSP (expr)                                                          \
    TEST4_PSPP (expr)                                                          \
    TEST4_PPPP (expr)

template <typename S, typename P> void test_pack_sp (const P *data)
{
    // std::cout << "    test_pack_sp<" << typeid(S).name() << ", " <<
    // typeid(P).name() << ">...\n";
    typedef layout<P> layout;
    typedef typename layout::u u;

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wshadow"
    {
        P a             = data[0];
        double expected = test_hmin (a);
        double actual   = hmin (a);

        if (bad (expected, actual)) {
            std::cerr << "ERROR test_pack:\n"
                      << typeid (a).name () << " a;\n"
                      << "a " << print (a) << "\n"
                      << "= " << actual << "\n"
                      << "hmin: expected " << double(expected) << ", got "
                      << actual << "\n";
            std::exit (EXIT_FAILURE);
        }
        ++count;
    }
    {
        P a             = data[0];
        double expected = test_hmax (a);
        double actual   = hmax (a);

        if (bad (expected, actual)) {
            std::cerr << "ERROR test_pack:\n"
                      << typeid (a).name () << " a;\n"
                      << "a " << print (a) << "\n"
                      << "= " << actual << "\n"
                      << "hmax: expected " << double(expected) << ", got "
                      << actual << "\n";
            std::exit (EXIT_FAILURE);
        }
        ++count;
    }

    {
        P a             = data[0];
        double expected = test_hadd (a);
        double actual   = hadd (a);

        if (bad (expected, actual)) {
            std::cerr << "ERROR test_pack:\n"
                      << typeid (a).name () << " a;\n"
                      << "a " << print (a) << "\n"
                      << "= " << actual << "\n"
                      << "hadd: expected " << double(expected) << ", got "
                      << actual << "\n";
            std::exit (EXIT_FAILURE);
        }
        ++count;
    }

    TEST1 (a)
    TEST1 (sqrt (a))
    TEST1 (rsqrt (a))
    TEST1 (abs (a))
    TEST1 (square (a))
    TEST1 (-a)

    TEST2 (min (a, b))
    TEST2 (max (a, b))

    TEST2_ (a += b)
    TEST3_ (a += b * c)
    TEST2_ (a -= b)
    TEST3_ (a -= b * c)
    TEST2_ (a *= b)
    TEST3_ (a *= b * c)
    TEST2_ (a /= b)
    TEST3_ (a /= b * c)

    TEST2 (a * b)
    TEST2 (a * -b)
    TEST2 (-a * b)
    TEST3 ((a * b) * c)
    TEST3 (a * (b * c))

    TEST2 (a / b)
    TEST2 (a / -b)
    TEST2 (-a / b)

    TEST2 (a + b)
    TEST3 (a * b + c)
    TEST3 (a + b * c)
    TEST4 (a * b + c * d)

    TEST2 (a - b)
    TEST2 (a - -b)
    TEST2 (-a - b)
    TEST2 (-a - -b)
    TEST3 (a * b - c)
    TEST3 (a - b * c)
    TEST4 (a * b - c * d)

    TEST2 (a + -b)
    TEST2 (-a + b)
    TEST2 (-a + -b)
    TEST3 (a * -b + c)
    TEST3 (a + -b * c)
    TEST4 (a * -b + -c * d)
    TEST4 (a * -b + c * d)

#pragma clang diagnostic pop
}

template <typename P> void test_pack_p (const P *data)
{
    // std::cout << "  test_pack_p<" << typeid(P).name() << ">...\n";
    test_pack_sp<double, P> (data);
    test_pack_sp<scalar, P> (data);
}

template <typename P> void test_pack_pd (const double *data)
{
    test_pack_p (static_cast<const P *> (static_cast<const void *> (data)));
}

void test_pack (const double *data)
{
    // std::cout << "test_pack...\n";
    test_pack_sp<double, scalar> (
        static_cast<const scalar *> (static_cast<const void *> (data)));
    test_pack_pd<pack2d> (data);
    test_pack_pd<pack4d> (data);
    test_pack_pd<X> (data);
    test_pack_pd<Y> (data);
    test_pack_pd<N> (data);
}

int main ()
{
    const unsigned size         = 40;
    const unsigned max_operands = 4;
    Y data[size];

    std::default_random_engine engine{42};
    std::uniform_int_distribution<int> dist{-10, 10};

    double *bdata = static_cast<double *> (static_cast<void *> (data));
    for (unsigned i = 0; i < sizeof (data) / sizeof (double); ++i)
        bdata[i]    = double(dist (engine));

    for (unsigned i = 0; i <= size - max_operands; ++i) {
        const double *bdata_i =
            static_cast<const double *> (static_cast<const void *> (data + i));
        test_pack (bdata_i);
    }

    std::cout << count << " tests passed.\n";
}

