# Design

## Goal

Introduce floating-point numbers, integer division, and remainder, building on the integer arithmetic already met in `lasagna`.

## Learning objectives

- Use the floating-point division word `/`.
- Use the integer division word `/i` and the remainder word `mod`.
- Use the floor word from `math.functions` together with `>integer` to produce an integer from a float.
- Compose previously-defined words inside a new word.

## Out of scope

- Rationals (Factor's `ratio` type).
- The full `math.functions` API (only `floor` is needed).
- Float precision and `unit-test~` tolerances (the test file uses `unit-test~` where exact comparison would fail; the student can use plain `unit-test` in their own experiments).

## Concepts

- `numbers`: floats vs integers, `/` vs `/i`, `mod`, `floor` plus `>integer`.

## Prerequisites

- `stack-effect` — taught in `lasagna`.
