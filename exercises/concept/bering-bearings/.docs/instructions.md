# Instructions

You are the watch officer aboard a cutter transiting the Bering
Strait. Three sources are calling out the position of every ice
floe and headland in sight:

- The **chart desk** speaks in compass directions —
  `north`, `east`, `south`, `west`. Just a heading, no distance.
- The **navigator** speaks in *polar* coordinates from the
  cutter's last fix: a magnitude in nautical miles, and a
  bearing in degrees clockwise from north (so `0` is north,
  `90` is east, `180` is south, `270` is west).
- The **masthead lookout** speaks in *relative* coordinates: a
  distance forward, and one of `ahead`, `starboard`, `behind`,
  `port`. Relative bearings are measured against *the ship's
  current heading* — the captain announces that heading on the
  bridge before each watch.

Your job is to convert all three into a common cartesian `(x, y)`
frame so the chart can be plotted. Bearings are degrees; `(0, 1)`
is one nautical mile north, `(1, 0)` is one nautical mile east.

## 1. Cartesian for cardinal

Define a tuple `cardinal` with one slot, `direction`, holding
one of `north`, `east`, `south`, `west` (declared with
`SYMBOLS:`). Then declare a `GENERIC:` word
`>cartesian ( direction -- x y )` and add an `M: cardinal`
method that returns the unit-vector for the named direction.

```factor
T{ cardinal { direction north } } >cartesian . .
! => 1
! => 0
! (top of stack is `y`, just below it is `x`)
```

## 2. Cartesian for polar

Define a tuple `polar` with slots `magnitude` and `bearing`
(degrees clockwise from north). Add an `M: polar` method to
`>cartesian` that converts the polar form to `(x, y)`:

```
x = magnitude * sin(bearing-in-radians)
y = magnitude * cos(bearing-in-radians)
```

```factor
T{ polar { magnitude 10 } { bearing 90 } } >cartesian . .
! => 0   (close to zero — the cosine of π/2 isn't exactly 0 in floats)
! => 10
```

## 3. Cartesian for relative

Define a tuple `relative` with slots `distance` and `bearing`
(one of the symbols `ahead`, `starboard`, `behind`, `port`).
Add an `M: relative` method to `>cartesian`. The catch: a
relative bearing is measured against the ship's *current
heading*, which isn't part of the tuple.

Declare a dynamic variable `heading` (with `SYMBOL:`). The
caller will set it inside a `with-variable` block. Your method
reads it with `heading get`, adds the bearing offset
(`ahead = 0`, `starboard = 90`, `behind = 180`, `port = 270`),
and produces the cartesian point.

```factor
0 heading [
    T{ relative { distance 5 } { bearing starboard } } >cartesian
] with-variable . .
! => 0   (heading 0 is north; starboard is east; (5, 0))
! => 5
```

## 4. Flip

Define a generic `flip ( direction -- direction' )` that returns
the opposite direction.

- For `cardinal`: north ↔ south, east ↔ west.
- For `polar`: add 180° to the bearing (modulo 360).
- For `relative`: ahead ↔ behind, starboard ↔ port.

```factor
T{ cardinal { direction north } } flip .
! => T{ cardinal { direction south } }

T{ polar { magnitude 10 } { bearing 90 } } flip .
! => T{ polar { magnitude 10 } { bearing 270 } }

T{ relative { distance 5 } { bearing ahead } } flip .
! => T{ relative { distance 5 } { bearing behind } }
```

## 5. Add bearings

Define `add-bearings ( a b -- x y )` that converts both
directions to cartesian and returns their sum. It works for any
mix of `cardinal`, `polar`, and `relative` — that's the payoff
of using a generic for `>cartesian`.

```factor
T{ cardinal { direction north } } T{ cardinal { direction east } } add-bearings . .
! => 1
! => 1
```
