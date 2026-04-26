# Design

## Goal

Introduce a complete novice to Factor by way of a tiny cooking-themed exercise. This is the first exercise on the track, so it has to teach the fundamentals from scratch: the data stack, words operating on it, and the stack-effect notation that documents every word.

## Learning objectives

- Understand that Factor passes values via a last-in-first-out data stack.
- Read and write a stack effect of the form `( inputs -- outputs )`.
- Define a word with `:` ... `;` and have its body match the declared stack effect.
- Define a constant with `CONSTANT:` and use it as a word.
- Use the integer arithmetic words `+`, `-`, `*`.
- Define a word whose body calls another word already in scope.
- Use `swap` to reorder the top two values when the operator wants them flipped.

## Out of scope

- Locals (`::`, named parameters).
- Combinators beyond `swap` (`dup`, `dip`, `bi`, `tri`, …).
- Floating-point arithmetic and the difference between `/` and `/i`.
- Vocabulary visibility, private words.
- Tests-framework internals beyond `unit-test`.

## Concepts

- `stack-effect`: every Factor word is documented as `( inputs -- outputs )` and its body must leave exactly that on the stack. This exercise is a student's first encounter with the notation and the calling convention behind it.

## Prerequisites

There are no prerequisites — this is the first concept exercise on the Factor track.
