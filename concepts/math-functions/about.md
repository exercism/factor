# About

The usual mathematical functions live in
[`math.functions`][math.functions], with the constants in
[`math.constants`][math.constants] and a few more float-only words in
[`math.libm`][math.libm]. Each takes its inputs from the stack:

```factor
USING: kernel math math.constants math.functions math.libm prettyprint ;

9 sqrt .            ! => 3.0
1.0 1.0 fatan2 .    ! => 0.7853981633974483
```

## Constants

| Word | Value |
| --- | --- |
| `pi` | π, 3.14159… |
| `e` | *e*, 2.71828… |

## Roots and powers

| Word | Stack effect | Answers |
| --- | --- | --- |
| `sqrt` | `( x -- y )` | the square root of `x` |
| `sq` | `( x -- y )` | `x * x` |
| `^` | `( x y -- z )` | `x` to the power `y`, which need not be whole |

## Trigonometry

| Word | Stack effect | Answers |
| --- | --- | --- |
| `sin` `cos` `tan` | `( x -- y )` | for an angle `x` in radians |
| `asin` `acos` `atan` | `( x -- y )` | the angle, in radians, whose sine, cosine or tangent is `x` |
| `fatan2` | `( y x -- z )` | the angle, in radians, from the positive `x` direction to the point (`x`, `y`) |
| `deg>rad` | `( x -- y )` | degrees converted to radians |
| `rad>deg` | `( x -- y )` | radians converted to degrees |

Every angle is in **radians**: a whole turn is 2π, not 360. Convert at
the edges and work in radians in between.

`fatan2` (from `math.libm`) is better than `atan` for finding a
direction. `1 1 / atan` cannot tell (1, 1) from (−1, −1), since both
divide to `1`, and it fails when `x` is zero. `fatan2` looks at both
signs and answers anywhere from −π to π:

```factor
1 1 / atan rad>deg .          ! => 45.0
-1 -1 / atan rad>deg .        ! => 45.0
-1.0 -1.0 fatan2 rad>deg .    ! => -135.0
```

## Exponentials and logarithms

| Word | Stack effect | Answers |
| --- | --- | --- |
| `e^` | `( x -- y )` | *e* to the power `x` |
| `log` | `( x -- y )` | the natural logarithm: the power *e* must be raised to, to give `x` |
| `10^` | `( x -- y )` | 10 to the power `x` |
| `log10` | `( x -- y )` | the logarithm base 10 |
| `log2` | `( x -- y )` | the logarithm base 2 |

`e^` and `log` undo each other, as do `10^` and `log10`.

Something that shrinks by the same fraction each step follows
`start * e^(-rate * t)`. The time it takes to fall from `start` to
`level` is `log(start / level) / rate`.

## When there is no real answer

None of these words throw an error for an awkward input. The square
root or logarithm of a negative number gives a **complex** result,
which prints with a `C{ ... }` around it rather than as a plain
number:

```factor
-1 sqrt .     ! => C{ 0.0 1.0 }
-1.0 log .    ! => C{ 0.0 3.141592653589793 }
0.0 log .     ! => -1/0.
```

`-1/0.` is negative infinity. Check an argument before the call when a
bad one is possible. A complex number or an infinity found three
calculations later is hard to trace back.

## Rounding is approximate here too

These words answer the nearest float, not the exact value, so compare
results with a tolerance using `~ ( x y epsilon -- ? )`, never with
`=`:

```factor
pi 6 / sin .             ! => 0.49999999999999994
pi 6 / sin 0.5 = .       ! => f
pi 6 / sin 0.5 1e-9 ~ .  ! => t
```

[math.functions]: https://docs.factorcode.org/content/vocab-math.functions.html
[math.constants]: https://docs.factorcode.org/content/vocab-math.constants.html
[math.libm]: https://docs.factorcode.org/content/vocab-math.libm.html
