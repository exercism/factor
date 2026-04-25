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
/   ( x y -- x/y )    ! float (or rational) result
/i  ( x y -- q   )    ! integer division (truncates toward negative infinity)
mod ( x y -- r   )    ! remainder
```

```factor
10 3 / .    ! => 10/3   (a rational; print as a fraction)
10 3 /i .   ! => 3      (truncated)
10 3 mod .  ! => 1
10.0 3 / .  ! => 3.3333333333333335
```

`/` produces a `ratio` (Factor's exact rational type) for two integers,
or a `float` if either input is a float. `/i` always rounds toward
negative infinity.

## Float to integer

`floor`, `ceil`, and `round` from the
[`math.functions`][math.functions] vocabulary all return a float
(`3.0`, not `3`). To get a true integer, chain `>integer`:

```factor
3.7 floor >integer .    ! => 3
3.2 ceil >integer .     ! => 4
```

[lasagna]: https://exercism.org/tracks/factor/exercises/lasagna
[math]: https://docs.factorcode.org/content/vocab-math.html
[math.functions]: https://docs.factorcode.org/content/vocab-math.functions.html
