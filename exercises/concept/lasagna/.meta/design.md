# Design

## Goal

Building on the data stack and shuffle words from `cargo-shuffle`, teach a complete novice to define their own words by way of a tiny cooking-themed exercise: integer arithmetic, naming fixed values with `CONSTANT:`, and composing a word out of words defined earlier.

## Learning objectives

- Define a word with `:` ... `;` and have its body match the declared stack effect.
- Define a constant with `CONSTANT:` and use it as a word.
- Use the integer arithmetic words `+`, `-`, `*`.
- Define a word whose body calls another word already in scope.
- Use `swap` (from `basics`) to reorder the top two values when the operator wants them flipped.

## Out of scope

- Locals (`::`, named parameters).
- Combinators beyond `swap` (`dup`, `dip`, `bi`, `tri`, …).
- Floating-point arithmetic and the difference between `/` and `/i`.
- Vocabulary visibility, private words.
- Tests-framework internals beyond `unit-test`.

## Concepts

- `words`: defining words with `:` ... `;`, naming fixed values with `CONSTANT:`, integer arithmetic with `+`, `-`, `*`, and calling one word from another. This is a student's first encounter with computing on the stack, rather than merely rearranging it.

## Prerequisites

- `basics` — taught in `cargo-shuffle`. The student must already understand the data stack, stack-effect notation, and shuffle words such as `swap`.
