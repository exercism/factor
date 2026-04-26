# Design

## Goal

Introduce string handling — splitting, trimming, case conversion, and
joining — by parsing simple `[LEVEL]: message` log lines.

## Learning objectives

- Use `split1` and `split` from `splitting` to break a string apart.
- Use `[ blank? ] trim` from `sequences` to strip whitespace.
- Use `>lower` from `ascii` to lowercase a string.
- Use `surround` and `glue` from `sequences` to assemble a result.
- Use `bi` to run two parsing words on the same input.

## Out of scope

- Regular expressions.
- Splitting on characters outside ASCII.
- `splitting.fast` and other performance variants.

## Concepts

- `strings`: the `splitting`, `ascii`, and `sequences` words used to
  pick apart and rebuild a string.

## Prerequisites

- `stack-effect` — taught in `lasagna`.
- `conditionals` — taught in `cars-assemble` (the student doesn't
  strictly need conditionals here, but the prereq pins this exercise
  later in the curriculum, after the easier numeric exercises).
