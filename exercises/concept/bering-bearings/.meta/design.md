# Design

## Goal

Teach `GENERIC:` and `M:` — Factor's multimethod-dispatch
mechanism — by giving the student three genuinely different
ways of describing a direction and a single operation
(`>cartesian`) that has to behave differently for each.

## Concept introduced

`generics` — declaring a generic word and adding methods that
dispatch on the class of the topmost argument.

## Prerequisite concepts

- `tuples` — for the three direction classes
- `locals` — `::` and `:>` make the bodies readable
- `case` — used inside each method to map symbol-labels to
  values
- `dynamic-variables` — the `relative` method reads `heading`
  from a `SYMBOL:` rather than as an explicit argument

## Why these three representations

- `cardinal` is pure label-to-value lookup; the simplest method
  body and a clean introduction to `M:`.
- `polar` is pure stack-effect arithmetic; demonstrates that
  methods aren't restricted to lookup tables.
- `relative` legitimately needs ambient context (the ship's
  heading) — this motivates `dynamic-variables` over threading
  yet another argument through every call. Students see *why*
  `SYMBOL:` + `with-variable` exists.

## Why bearings clockwise from north

It's the maritime/aviation standard, so the framing reads
naturally. Mathematically it also happens to be cleaner than
the math-convention (counterclockwise from east): bearing 0
gives `(0, magnitude)` directly via `(sin θ, cos θ)`, no 90°
fudge.

## Tasks ramp

1. `>cartesian` for `cardinal` — first method. Pure case-lookup.
2. `>cartesian` for `polar` — adds arithmetic, no ambient state.
3. `>cartesian` for `relative` — adds the dynamic variable.
4. `flip` — second generic, demonstrates that Factor doesn't
   limit you to one generic per class.
5. `add-bearings` — composes the generic across heterogeneous
   inputs; the payoff is that the same caller works for any mix
   of `cardinal`/`polar`/`relative`.
