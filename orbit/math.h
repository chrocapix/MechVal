#pragma once

#include <algorithm>
#include <cmath>
#include <x86intrin.h>

namespace math
{

typedef __m128d v2d;
typedef __m128 v4f;
typedef __m256d v4d;

static inline v2d widen2 (double a) { return {a, a}; }
static inline v4d widen4 (double a) { return {a, a, a, a}; }

static inline v2d lo (v4d a) { return {a[0], a[1]}; }
static inline v2d hi (v4d a) { return {a[2], a[3]}; }
static inline v4d pack (v2d a, v2d b) { return {a[0], a[1], b[0], b[1]}; }

// clang-format off

static inline double abs (double a) { return std::abs (a); }
static inline v2d    abs (v2d    a) { return {std::abs (a[0]), std::abs (a[1])}; }
static inline v4d    abs (v4d    a) { return {std::abs (a[0]), std::abs (a[1]), std::abs (a[2]), std::abs (a[3])}; }

static inline double sign (double a) { return a < 0 ? -1 : a > 0 ? 1 : a; }

static inline double sqrt (double a) { return _mm_sqrt_sd (v2d{a}, v2d{a})[0]; }
static inline v2d    sqrt (v2d    a) { return _mm_sqrt_pd (a); }
#ifdef __AVX__
static inline v4d    sqrt (v4d    a) { return _mm256_sqrt_pd (a); }
#else
static inline v4d    sqrt (v4d    a) { return pack (sqrt (lo (a)), sqrt (hi (a))); }
#endif

static inline float  rsqrt (float a) { return _mm_rsqrt_ss (v4f{a})[0]; }
static inline v4f    rsqrt (v4f   a) { return _mm_rsqrt_ps (a); }

static inline double rsqrt (double a) { return double (rsqrt (float (a))); }
static inline v2d    rsqrt (v2d    a) {
    v4f r = rsqrt (v4f{float (a[0]), float (a[1])});
    return { r[0], r[1] };
}
static inline v4d    rsqrt (v4d    a) {
    v4f r = rsqrt (v4f{float (a[0]), float (a[1]), float (a[2]), float (a[3])});
    return { r[0], r[1], r[2], r[3] };
}

static inline double max (double a, double b) { return std::max (a, b); }
static inline v2d    max (v2d    a, v2d    b) { return _mm_max_pd (a, b); }
#ifdef __AVX__
static inline v4d    max (v4d    a, v4d    b) { return _mm256_max_pd (a, b); }
#else
static inline v4d    max (v4d    a, v4d    b) { return pack (max (lo (a), lo (b)), max (hi (a), hi (b))); }
#endif

static inline double min (double a, double b) { return std::min (a, b); }
static inline v2d    min (v2d    a, v2d    b) { return _mm_min_pd (a, b); }
#ifdef __AVX__
static inline v4d    min (v4d    a, v4d    b) { return _mm256_min_pd (a, b); }
#else
static inline v4d    min (v4d    a, v4d    b) { return pack (min (lo (a), lo (b)), min (hi (a), hi (b))); }
#endif

static inline v4d phmin (v2d a) { return pack (a, a); }
static inline v4d phmax (v2d a) { return pack (a, a); }
static inline v4d phmin (v4d a) { return a; }
static inline v4d phmax (v4d a) { return a; }

static inline double hmin (double a) { return a; }
static inline double hmax (double a) { return a; }
static inline double hmin (v2d a) { return min (a[0], a[1]); }
static inline double hmin (v4d a) { return hmin (min (lo (a), hi (a))); }
static inline double hmax (v2d a) { return max (a[0], a[1]); }
static inline double hmax (v4d a) { return hmax (max (lo (a), hi (a))); }

static inline v4d phadd (v2d a) { return pack (a, v2d{0,0}); }
static inline v4d phadd (v4d a) { return a; }

static inline double hadd (double a) { return a; }
static inline double hadd (v2d a) { return a[0] + a[1]; }
static inline double hadd (v4d a) { return hadd (lo (a) + hi (a)); }

#ifdef __FMA__
static inline double    muladd (double a, double b, double c) { return    _mm_fmadd_sd (v2d{a}, v2d{b}, v2d{c})[0]; }
static inline v2d       muladd (v2d    a, v2d    b, v2d    c) { return    _mm_fmadd_pd (a, b, c); }
static inline v4d       muladd (v4d    a, v4d    b, v4d    c) { return _mm256_fmadd_pd (a, b, c); }
static inline double negmuladd (double a, double b, double c) { return    _mm_fnmadd_sd (v2d{a}, v2d{b}, v2d{c})[0]; }
static inline v2d    negmuladd (v2d    a, v2d    b, v2d    c) { return    _mm_fnmadd_pd (a, b, c); }
static inline v4d    negmuladd (v4d    a, v4d    b, v4d    c) { return _mm256_fnmadd_pd (a, b, c); }
static inline double    mulsub (double a, double b, double c) { return    _mm_fmsub_sd (v2d{a}, v2d{b}, v2d{c})[0]; }
static inline v2d       mulsub (v2d    a, v2d    b, v2d    c) { return    _mm_fmsub_pd (a, b, c); }
static inline v4d       mulsub (v4d    a, v4d    b, v4d    c) { return _mm256_fmsub_pd (a, b, c); }
#else                  
static inline double    muladd (double a, double b, double c) { return a * b + c; }
static inline v2d       muladd (v2d    a, v2d    b,    v2d c) { return a * b + c; }
static inline v4d       muladd (v4d    a, v4d    b,    v4d c) { return a * b + c; }
static inline double negmuladd (double a, double b, double c) { return -a * b + c; }
static inline v2d    negmuladd (v2d a,       v2d b, v2d    c) { return -a * b + c; }
static inline v4d    negmuladd (v4d a,       v4d b, v4d    c) { return -a * b + c; }
static inline double    mulsub (double a, double b, double c) { return a * b - c; }
static inline v2d       mulsub (v2d    a, v2d    b,    v2d c) { return a * b - c; }
static inline v4d       mulsub (v4d    a, v4d    b,    v4d c) { return a * b - c; }
#endif
// clang-format on

namespace detail
{
template <typename N, typename T> struct operators {

    struct M {
        N a, b;
        operator T () const { return a * b; }
    };

    // clang-format off
    
    friend T  sqrt (T a) { return  sqrt (N (a)); }
    friend T rsqrt (T a) { return rsqrt (N (a)); }
    friend T   abs (T a) { return   abs (N (a)); }

    friend T min (T a, T b) { return min (N (a), N (b)); }
    friend T max (T a, T b) { return max (N (a), N (b)); }

    friend double hmin (T a) { return hmin (N (a)); }
    friend double hmax (T a) { return hmax (N (a)); }
    friend double hadd (T a) { return hadd (N (a)); }
    
    friend T operator- (T a) { return -N (a); }

    friend M operator* (T a, T b) { return {N (a), N (b)}; }
    friend M square (T a) { return a * a; }

    friend T operator/ (T a, T b) { return N (a) / N (b); }

    friend T operator+ (T a, T b) { return N (a) + N (b); }
    friend T operator+ (M a, T b) { return muladd (a.a, a.b, N (b)); }
    friend T operator+ (T a, M b) { return b + a; }
    friend T operator+ (M a, M b) { return a + T (b); }

    friend T operator- (T a, T b) { return N (a) - N (b); }
    friend T operator- (M a, T b) { return    mulsub (a.a, a.b, N (b)); }
    friend T operator- (T a, M b) { return negmuladd (b.a, b.b, N (a)); }
    friend T operator- (M a, M b) { return a - T (b); }

    friend T & operator*= (T & a, T b) { return a = a * b; }
    friend T & operator/= (T & a, T b) { return a = a / b; }
    friend T & operator+= (T & a, T b) { return a = a + b; }
    friend T & operator+= (T & a, M b) { return a = a + b; }
    friend T & operator-= (T & a, T b) { return a = a - b; }
    friend T & operator-= (T & a, M b) { return a = a - b; }
    // clang-format on
};
}

template <typename T> struct pack_operators {
    struct M {
        const T &a;
        const T &b;
        operator T () const { return {lo (a) * lo (b), hi (a) * hi (b)}; }
    };

    // clang-format off
    friend T sqrt (const T &a) { return {sqrt (lo(a)), sqrt(hi(a))}; }
    friend T rsqrt (const T &a) { return {rsqrt (lo(a)), rsqrt(hi(a))}; }
    friend T abs (const T &a) { return {abs (lo(a)), abs(hi(a))}; }
    friend T min (const T &a, const T &b) { return {min (lo (a), lo (b)), min (hi (a), hi (b))}; }
    friend T max (const T &a, const T &b) { return {max (lo (a), lo (b)), max (hi (a), hi (b))}; }
  private:
    friend v4d phadd (const T &a) { return phadd (lo (a)) + phadd (hi (a)); }
    friend v4d phmin (const T &a) { return min (phmin (lo (a)), phmin (hi (a))); }
    friend v4d phmax (const T &a) { return max (phmax (lo (a)), phmax (hi (a))); }
  public:
    friend double hadd (const T &a) { return hadd (phadd (a)); }
    friend double hmin (const T &a) { return hmin (phmin (a)); }
    friend double hmax (const T &a) { return hmax (phmax (a)); }


    friend T operator- (const T &a) { return {-lo (a), -hi (a)}; }

    friend M operator* (const T &a, const T &b) { return {a, b}; }
    friend M square (const T &a) { return a * a; }

    friend T operator/ (const T &a, const T &b) { return {lo (a) / lo (b),
                                                          hi (a) / hi (b)}; }

    friend T operator+ (const T &a, const T &b) { return {lo (a) + lo (b),
                                                          hi (a) + hi (b)}; }
    friend T operator+ (M        a, const T &b) { return {lo (a.a) * lo (a.b) + lo (b),
                                                          hi (a.a) * hi (a.b) + hi (b)}; }
    friend T operator+ (const T &a, M        b) { return b + a; }
    friend T operator+ (M        a, M        b) { return a + T (b); }

    friend T operator- (const T &a, const T &b) { return {lo (a) - lo (b),
                                                          hi (a) - hi (b)}; }
    friend T operator- (M        a, const T &b) { return {lo (a.a) * lo (a.b) - lo (b),
                                                          hi (a.a) * hi (a.b) - hi (b)}; }
    friend T operator- (const T &a, M        b) { return {lo (a) - lo (b.a) * lo (b.b),
                                                          hi (a) - hi (b.a) * hi (b.b) }; }
    friend T operator- (M        a, M        b) { return a - T (b); }
    
    friend T & operator*= (T & a, const T &b) { return a = a * b; }
    friend T & operator/= (T & a, const T &b) { return a = a / b; }
    friend T & operator+= (T & a, const T &b) { return a = a + b; }
    friend T & operator+= (T & a, M        b) { return a = a + b; }
    friend T & operator-= (T & a, const T &b) { return a = a - b; }
    friend T & operator-= (T & a, M        b) { return a = a - b; }
    // clang-format on
};

#define MATH_PACK_OPERATORS_DECLARE(type, lo_type, lo_name, hi_type, hi_name)  \
    lo_type lo_name;                                                           \
    hi_type hi_name;                                                           \
                                                                               \
    type () = default;                                                         \
    type (math::scalar x)                                                      \
        : type (double(x))                                                     \
    {                                                                          \
    }                                                                          \
    type (math::scalar::M x)                                                   \
        : type (math::scalar (x))                                              \
    {                                                                          \
    }                                                                          \
    type (double x)                                                            \
        : lo_name{x}                                                           \
        , hi_name{x}                                                           \
    {                                                                          \
    }                                                                          \
    type (lo_type x, hi_type y)                                                \
        : lo_name{x}                                                           \
        , hi_name{y}                                                           \
    {                                                                          \
    }                                                                          \
                                                                               \
    friend lo_type lo (const type &a) { return a.lo_name; }                    \
    friend hi_type hi (const type &a) { return a.hi_name; }

struct scalar : detail::operators<double, scalar> {

    scalar () = default;
    scalar (double v)
        : v{v}
    {
    }
    explicit operator double () const { return v; }

    friend scalar sign (scalar a) { return sign (a.v); }

    // clang-format off
    friend bool operator== (scalar a, scalar b) { return a.v == b.v; }
    friend bool operator!= (scalar a, scalar b) { return a.v != b.v; }
    friend bool operator<  (scalar a, scalar b) { return a.v <  b.v; }
    friend bool operator<= (scalar a, scalar b) { return a.v <= b.v; }
    friend bool operator>  (scalar a, scalar b) { return a.v >  b.v; }
    friend bool operator>= (scalar a, scalar b) { return a.v >= b.v; }
    // clang-format on

  private:
    double v;
};

struct pack2d : detail::operators<v2d, pack2d> {

    pack2d () = default;
    pack2d (double v)
        : v{widen2 (v)}
    {
    }
    pack2d (double v1, double v2)
        : v{v1, v2}
    {
    }
    pack2d (scalar v1, scalar v2)
        : v{double(v1), double(v2)}
    {
    }
    pack2d (scalar v)
        : pack2d{double(v)}
    {
    }
    pack2d (scalar::M m)
        : pack2d{scalar (m)}
    {
    }
    pack2d (v2d v)
        : v{v}
    {
    }
    operator v2d () const { return v; }
    scalar operator[] (int i) const { return v[i]; }

  private:
    v2d v;
};

struct pack4d : detail::operators<v4d, pack4d> {

    pack4d () = default;
    pack4d (double v)
        : v{widen4 (v)}
    {
    }
    pack4d (double v1, double v2, double v3, double v4)
        : v{v1, v2, v3, v4}
    {
    }
    pack4d (scalar v1, scalar v2, scalar v3, scalar v4)
        : v{double(v1), double(v2), double(v3), double(v4)}
    {
    }
    pack4d (scalar v)
        : pack4d{double(v)}
    {
    }
    pack4d (scalar::M m)
        : pack4d{scalar (m)}
    {
    }
    pack4d (v4d v)
        : v{v}
    {
    }
    operator v4d () const { return v; }
    scalar operator[] (int i) const { return v[i]; }

  private:
    v4d v;
};

struct vect3d {

    vect3d () = default;
    explicit vect3d (double x)
        : v{widen4 (x)}
    {
    }
    vect3d (double x, double y, double z)
        : v{x, y, z, 0}
    {
    }
    explicit vect3d (scalar x)
        : vect3d{double(x)}
    {
    }
    explicit vect3d (scalar::M m)
        : vect3d{scalar (m)}
    {
    }
    vect3d (v4d v)
        : v{v}
    {
    }
    explicit vect3d (pack4d x)
        : v{v4d (x)}
    {
    }

    explicit operator pack4d () const { return v; }
    explicit operator v4d () const { return v; }

    scalar x () const { return v[0]; }
    scalar y () const { return v[1]; }
    scalar z () const { return v[2]; }

    friend bool operator== (vect3d a, vect3d b)
    {
        return a.x () == b.x () && a.y () == b.y () && a.z () == b.z ();
    }
    friend bool operator!= (vect3d a, vect3d b) { return !(a == b); }

    struct M {
        v4d a;
        v4d b;
        operator vect3d () const { return a * b; }
    };

    friend vect3d operator- (vect3d a) { return -a.v; }

    friend vect3d operator+ (M a, vect3d b) { return muladd (a.a, a.b, b.v); }
    friend vect3d operator+ (M a, M b) { return a + vect3d (b); }
    friend vect3d operator+ (vect3d a, M b) { return b + a; }
    friend vect3d operator+ (vect3d a, vect3d b) { return a.v + b.v; }

    friend vect3d operator- (M a, vect3d b) { return mulsub (a.a, a.b, b.v); }
    friend vect3d operator- (M a, M b) { return a - vect3d (b); }
    friend vect3d operator- (vect3d a, M b)
    {
        return negmuladd (b.a, b.b, a.v);
    }
    friend vect3d operator- (vect3d a, vect3d b) { return a.v - b.v; }

    friend M operator* (vect3d a, scalar b)
    {
        return {a.v, widen4 (double(b))};
    }
    friend M operator* (scalar a, vect3d b) { return b * a; }

    friend vect3d operator/ (vect3d a, scalar b)
    {
        return a.v / widen4 (double(b));
    }

    friend scalar operator* (vect3d a, vect3d b) { return hadd3 (a.v * b.v); }
    friend scalar square (vect3d a) { return a * a; }
    friend vect3d operator^ (vect3d a, vect3d b)
    {
        return mulsub (yzx (a.v), zxy (b.v), yzx (b.v) * zxy (a.v));
    }
    friend vect3d operator*= (vect3d &a, scalar b) { return a = a * b; }
    friend vect3d operator+= (vect3d &a, vect3d b) { return a = a + b; }
    friend vect3d operator-= (vect3d &a, vect3d b) { return a = a - b; }

  private:
    static v4d yzx (v4d a) { return {a[1], a[2], a[0], a[3]}; }
    static v4d zxy (v4d a) { return {a[2], a[0], a[1], a[3]}; }

    static double hadd3 (v4d a) { return a[0] + a[1] + a[2]; }
    v4d v;
};
}
