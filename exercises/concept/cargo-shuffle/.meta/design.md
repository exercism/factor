# Design

## Goal

Introduce a complete novice to Factor's data stack. This is the first exercise on the track, so it teaches the most fundamental idea from scratch — values are passed on a last-in-first-out data stack — and the stack-effect notation that documents every word, using nothing but stack manipulation. Arithmetic, constants and word reuse are deferred to `lasagna`.

## Learning objectives

- Understand that Factor passes values via a last-in-first-out data stack.
- Read a stack effect of the form `( inputs -- outputs )`.
- Define a word with `:` ... `;` whose body matches the declared stack effect.
- Reach for the right shuffle word — `dup`, `drop`, `swap`, `over`, `nip`, `rot` — to rearrange the top of the stack.

## Out of scope

- Arithmetic (`+`, `-`, `*`) and constants (`CONSTANT:`) — taught in `lasagna`.
- Locals (`::`, named parameters).
- Combinators and the wider shuffle family (`dip`, `bi`, `tri`, `pick`, `tuck`, `2dup`, …).
- Conditionals and booleans.
- Tests-framework internals beyond `unit-test`.

## Concepts

- `basics`: every value travels on the data stack, and every word is documented as `( inputs -- outputs )`. This exercise is a student's first encounter with the stack and the shuffle words that rearrange it.

## Prerequisites

There are no prerequisites — this is the first concept exercise on the Factor track.
