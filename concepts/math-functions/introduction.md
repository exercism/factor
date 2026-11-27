# Introduction

Square roots, angles and growth curves are hard to work out with `+`,
`-`, `*` and `/` alone. The [`math.functions`][math.functions]
vocabulary has words that work them out for you, and
[`math.constants`][math.constants] has π:

```factor
USING: kernel math math.constants math.functions math.libm prettyprint ;

9 sqrt .              ! => 3.0
2 pi * .              ! => 6.283185307179586
```

`sin`, `cos` and `tan` take angles in **radians**, where a half turn is
π rather than 180. `deg>rad` and `rad>deg` convert between the two:

```factor
30 deg>rad sin 10 * .     ! => 4.999999999999999
```

`fatan2 ( y x -- radians )`, from [`math.libm`][math.libm], goes the
other way: given how far up and how far across, it answers the angle:

```factor
1.0 1.0 fatan2 rad>deg .  ! => 45.0
```

`e^` raises *e* (about 2.718) to a power, and `log` undoes it:

```factor
1 e^ .                    ! => 2.718281828459045
2 e^ log .                ! => 2.0
```

The answers are the nearest float, not the exact value, so compare
them with a tolerance rather than with `=`.

[math.functions]: https://docs.factorcode.org/content/vocab-math.functions.html
[math.constants]: https://docs.factorcode.org/content/vocab-math.constants.html
[math.libm]: https://docs.factorcode.org/content/vocab-math.libm.html
