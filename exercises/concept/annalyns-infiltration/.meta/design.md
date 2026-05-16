# Design

## Goal

Introduce the boolean literals `t`/`f`, the boolean combinators
`and`/`or`/`not`, and the basic `kernel` shuffle words a student
will need throughout the rest of the track.

## Learning objectives

- Use `t` and `f`, knowing that `f` is Factor's only falsy value.
- Combine booleans with `and`, `or`, and `not`.
- Reach for the right shuffle word (`dup`, `drop`, `swap`,
  `over`, …) to line up arguments without a temporary local.
- Compose several boolean operations inside a single `:` body.

## Out of scope

- Short-circuit semantics — `and`/`or` here are plain boolean
  combinators, not conditional words.
- `xor`, `?` (ternary), and the larger `boolean=` / `?if` family.
- Locals (`::`, `[| … |]`); these tasks are deliberately solvable
  with shuffle words only.

## Concepts

- `booleans`: `t`/`f`, `and`/`or`/`not`, and the shuffle vocabulary
  needed to feed them their arguments.

## Prerequisites

- `basics` — taught in `lasagna`.
