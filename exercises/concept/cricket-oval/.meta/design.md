# Design

## Goal

Introduce the everyday math words: `pi`, `sqrt`, `sin`, `fatan2`,
`e^` and `log`, and the one trap they share: angles are in radians.

## Learning objectives

- Push `pi` from `math.constants`.
- Use `sqrt` from `math.functions`.
- Convert degrees to radians with `deg>rad` before `sin`, and radians
  to degrees with `rad>deg` after `fatan2`.
- Know `fatan2`'s stack order, `( y x -- radians )`, and that it lives
  in `math.libm`.
- Use `e^` for steady decay, and `log` to undo it.

## Out of scope

- Complex numbers. Students have not met them yet, so the exercise
  never uses `rect>` or `arg`. Factor has no `atan2` in
  `math.functions`, and `fatan2` is the direction word taught instead.
  No test passes `sqrt` or `log` a negative number, which in Factor
  gives a complex result rather than NaN.
- `cos`, `tan`, `10^`, `log10` and the rest of the table in the
  concept's about.md. They are called the same way and need no task
  of their own.
- Infinity and NaN. No test passes an argument outside a word's
  domain.

## Concepts

- `math-functions`

## Prerequisites

- `numbers`: floats and the arithmetic words.
- `combinators`: `bi@` in task 2 and `bi*` in task 4.

## Notes

Ported from the Sather track's Cricket Oval exercise, with the same
six tasks and test values.

Tasks 3 and 4 are shaped around forgetting the radians conversion,
which no test value forgives. Task 4 has no 90 degree test, because
sin(π) comes out as about 1e-16 rather than 0. That is the
floating-point lesson, not this one.

Every test uses `unit-test~` with a tolerance of `1e-9`, so any order
of multiplying and dividing passes.
