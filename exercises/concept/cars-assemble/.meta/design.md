# Design

## Goal

Introduce Factor's conditional combinators by mapping a discrete input
(speed) onto a discrete output (success rate).

## Learning objectives

- Use comparison words `=`, `<`, `<=`, `>`, `>=` from `math` and `kernel`.
- Use `if`, `when`, `unless` to choose between two quotations.
- Use `cond` from `combinators` for a chained "first matching predicate"
  selection.
- Combine the `dup` … `drop` pattern with `cond` to inspect a value
  without consuming it.

## Out of scope

- `case` from `combinators` for value-based dispatch.
- Multimethods, `GENERIC:`.
- Arithmetic combinators like `bi` are introduced incidentally for
  task 2; deeper coverage belongs in a later exercise.

## Concepts

- `conditionals`: `if`, `when`, `unless`, and especially `cond`.

## Prerequisites

- `booleans` — taught in `annalyns-infiltration`.
- `numbers` — taught in `currency-conversion`.
