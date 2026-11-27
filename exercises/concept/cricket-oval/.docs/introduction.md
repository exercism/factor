# Introduction

## Math Functions

Square roots, angles and growth curves are hard to work out with `+`,
`-`, `*` and `/` alone. The [`math.functions`][math.functions]
vocabulary has words that work them out for you, and
[`math.constants`][math.constants] has π. Like every other word, each
one takes its inputs from the stack and leaves its answer there.

## Square roots

```
sqrt ( x -- y )
```

```factor
USING: kernel math math.constants math.functions math.libm prettyprint ;

9 sqrt .     ! => 3.0
2 sqrt .     ! => 1.4142135623730951
```

A ladder 5 metres long, with its foot 3 metres from a wall, reaches
4 metres up it:

```factor
5 sq 3 sq - sqrt .   ! => 4.0
```

## Pi

`pi` (from `math.constants`) pushes π, the number of times a circle's
diameter fits round its edge:

```factor
: wheel-edge ( diameter -- edge ) pi * ;

2 wheel-edge .   ! => 6.283185307179586
```

## Angles are in radians

```
sin ( x -- y )
cos ( x -- y )
tan ( x -- y )
```

`sin`, `cos` and `tan` take an angle, but not in degrees. They use
**radians**, where a half turn is π rather than 180. Giving them
degrees is not an error: it quietly gives the wrong answer.

`deg>rad` converts degrees to radians, and `rad>deg` converts back.
They are the same as multiplying by π and dividing by 180, or the other
way round:

```
deg>rad ( x -- y )
rad>deg ( x -- y )
```

```factor
30 deg>rad .       ! => 0.5235987755982988
30 pi * 180 / .    ! => 0.5235987755982988
pi rad>deg .       ! => 180.0
```

Convert degrees to radians before calling `sin`:

```factor
: ramp-rise ( length degrees -- rise ) deg>rad sin * ;

10 30 ramp-rise .   ! => 4.999999999999999
```

A ramp 10 metres long at 30 degrees rises 5 metres. The answer prints
as `4.999999999999999` because math functions give the nearest float,
not the exact value. Without the conversion, `30 sin` treats 30 as
radians (nearly five whole turns) and the ramp would "rise"
`-9.88` metres.

## Finding an angle

`fatan2` goes the other way: given how far up and how far across, it
answers the angle in radians. It lives in [`math.libm`][math.libm].
The *up* distance goes on the stack first, then the *across*
distance:

```
fatan2 ( y x -- radians )
```

```factor
1.0 1.0 fatan2 .              ! => 0.7853981633974483
1.0 1.0 fatan2 rad>deg .      ! => 45.0
-1.0 -1.0 fatan2 rad>deg .    ! => -135.0
0.0 -1.0 fatan2 rad>deg .     ! => 180.0
```

The angle is measured from the positive *across* direction. `fatan2`
looks at the signs of both distances, so it can answer anywhere from
−180 to 180 degrees.

## Powers of ten: 10^ and log10

`10^` raises 10 to a power:

```factor
5 10^ .     ! => 100000
2 10^ .     ! => 100
0.5 10^ .   ! => 3.1622776601683795
```

`log10` goes back the other way. It answers the question "10 to what
power gives this number?" That answer is the number's **logarithm**:

```factor
100000 log10 .   ! => 5.0
100 log10 .      ! => 2.0
1 log10 .        ! => 0.0
0.001 log10 .    ! => -3.0
```

## e^ and log

`e^` and `log` are the same pair, with *e* (about 2.718) in place of
10. `e^` raises *e* to a power, and `log` answers "*e* to what power
gives this number?"

```
e^  ( x -- y )
log ( x -- y )
```

Mathematicians use *e* for anything that grows or shrinks by the same
fraction each step. Money earning interest is one example, and a cup
of tea cooling down is another:

```factor
! 80 degrees hotter than the room, the gap shrinking by 5% a minute
: tea-gap ( minutes -- gap ) -0.05 * e^ 80 * ;

0 tea-gap .    ! => 80.0
10 tea-gap .   ! => 48.52245277701067
```

`log` undoes `e^`. That answers the question the other way round: how
many minutes until the gap is down to 40 degrees?

```factor
80 40 / log 0.05 / .   ! => 13.862943611198904
```

[math.functions]: https://docs.factorcode.org/content/vocab-math.functions.html
[math.constants]: https://docs.factorcode.org/content/vocab-math.constants.html
[math.libm]: https://docs.factorcode.org/content/vocab-math.libm.html
