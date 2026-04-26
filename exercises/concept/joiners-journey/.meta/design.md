# Design

## Goal

Show the student that the four common shuffle words (`dup`, `over`,
`swap`, `rot`) have named, composable counterparts — combinators
— that make multi-input / multi-output code far easier to read.

## Learning objectives

- Recognise the shuffle words `dup`, `swap`, `over`, `rot`, `nip`,
  `drop`.
- Use `keep` to apply a quotation while preserving the input.
- Use `bi` for two quotations on one input; `tri` and `cleave` for
  three or more.
- Use `dip` to operate on values under the top of stack.
- Use `bi@` to apply the same quotation to two values.

## Out of scope

- `bi*`, `tri*`, `tri@` — covered briefly in the introduction but
  not exercised here.
- `2bi`, `2tri`, `3tri`, `n*tri` — the multi-input variants.
- `curry` and `compose` — those are for `coordinate-choreography`.

## Concepts

- `combinators`: choosing the right combinator (`keep`, `bi`,
  `tri`/`cleave`, `dip`, `bi@`) over manual stack shuffling.

## Prerequisites

- `stack-effect` — taught in `lasagna`. The student must already be
  comfortable reading and writing stack-effect declarations.
- `numbers` — taught in `currency-conversion`. Light arithmetic only.
- `quotations` — introduced in `high-school-sweetheart`. The
  student must know that `[ … ]` is a value.

## Calling-convention note for task 4

`per-piece` was deliberately given the stack effect
`( bolt-length pieces -- per-piece )` rather than the reverse, so
that `dip` is the natural fit (operate on `bolt-length` underneath
while `pieces` rides on top). Reverse the order and `dip` becomes
contrived — picking the right calling convention is itself part of
the lesson.
