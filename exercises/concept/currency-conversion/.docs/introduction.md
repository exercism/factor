# Introduction

This exercise builds on the integer arithmetic from
[Leah's Luscious Lasagna][lasagna]. Here you will work with floating-
point numbers and pick the right division word for the job.

## Integers and floats

Factor distinguishes integers (`1`, `42`, `1_000_000`) from floating-
point numbers (`1.0`, `3.14`, `6.02e23`). Mixed arithmetic auto-
promotes to a float:

```factor
2 3 + .      ! => 5
2 3.0 + .    ! => 5.0
```

Underscores are allowed inside number literals as digit separators
and are ignored by the parser.

## Division words

Factor has separate division words. They all live in the [`math`][math]
vocabulary.

```
/    ( x y -- x/y )    ! float (or rational) result
/i   ( x y -- q   )    ! integer division (truncates toward negative infinity)
mod  ( x y -- r   )    ! remainder
/mod ( x y -- q r )    ! quotient and remainder together
```

```factor
16 3 / .       ! => 16/3   (a rational; print as a fraction)
16 3 /i .      ! => 5      (truncated)
16 3 mod .     ! => 1
16 3 /mod .s   ! quotient and remainder in one pass
! => 5
! => 1
16.0 3 / .     ! => 5.333333333333333
```

`/` produces a `ratio` (Factor's exact rational type) for two integers,
or a `float` if either input is a float. `/i` always rounds toward
negative infinity.

## Checking

Number predicates from [`math`][math],
[`math.order`][math.order], and [`math.primes`][math.primes]:

```
zero?    ( x       -- ? )
even?    ( x       -- ? )
odd?     ( x       -- ? )
prime?   ( x       -- ? )
divisor? ( m n     -- ? )    ! true when n divides m
between? ( x lo hi -- ? )    ! lo <= x <= hi (inclusive)
```

```factor
0 zero? .            ! => t
0.0 zero? .          ! => t
3 zero? .            ! => f

4 even? .            ! => t
7 even? .            ! => f
7 odd? .             ! => t

7 prime? .           ! => t
9 prime? .           ! => f

15 5 divisor? .      ! => t   (5 divides 15)
15 4 divisor? .      ! => f

5 1 10 between? .    ! => t
0 1 10 between? .    ! => f
10 1 10 between? .   ! => t   (inclusive at both ends)
```

## Float to integer

`floor`, `ceiling`, and `round` from the
[`math.functions`][math.functions] vocabulary all return a float
(`3.0`, not `3`). To get a true integer, chain `>integer`:

```factor
3.7 floor >integer .       ! => 3
3.2 ceiling >integer .     ! => 4
```

## Powers and absolute value

`sq`, `^`, and `abs` (in [`math.functions`][math.functions])
compute squares, arbitrary powers, and absolute values:

```
sq  ( x   -- x*x )
^   ( x y -- x^y )
abs ( x   -- |x| )
```

```factor
5 sq .          ! => 25
2 10 ^ .        ! => 1024
2 0.5 ^ .       ! => 1.4142135623730951
-7 abs .        ! => 7
3 abs .         ! => 3
```

## Min and max

`min ( x y -- z )` and `max ( x y -- z )` (in
[`math.order`][math.order]) return the lesser or greater of two
numbers:

```factor
3 7 min .       ! => 3
3 7 max .       ! => 7
```

The most common use is *clamping* — pinning a value to a floor
with `max` (e.g., `0 max` keeps a value non-negative) or to a
ceiling with `min`.

[lasagna]: https://exercism.org/tracks/factor/exercises/lasagna
[math]: https://docs.factorcode.org/content/vocab-math.html
[math.functions]: https://docs.factorcode.org/content/vocab-math.functions.html
[math.order]: https://docs.factorcode.org/content/vocab-math.order.html
[math.primes]: https://docs.factorcode.org/content/vocab-math.primes.html
