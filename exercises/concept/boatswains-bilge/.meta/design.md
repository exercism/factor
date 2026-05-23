# Design

## Goal

Teach the [`destructors`][destructors] framework on its own,
ahead of `telegraphers-tape`. The student practises the public
disposal API across one and many resources, distinguishes
always-vs-failure-only registration, and finally writes their
own disposable class. By the time they reach `telegraphers-tape`
the streams intro only has to cover the *stream* protocol.

## Learning objectives

- Call `dispose` directly and rely on the at-most-once
  guarantee.
- Wrap a single resource with `with-disposal`.
- Open a `with-destructors` scope and register more than one
  resource with `&dispose`.
- Choose `|dispose` (failure-only) over `&dispose` (always) when
  the success path keeps the resource.
- Build a fresh disposable class: extend `disposable`, construct
  with `new-disposable`, implement `dispose*`.

## Out of scope

- The streams protocol itself (taught in `telegraphers-tape`).
- `dispose-each` and other mass-dispose conveniences.
- Restartable conditions and the `condition` machinery.
- `cleanup` from `continuations` — mentioned in the intro as the
  bare primitive, but `with-destructors` is the idiomatic modern
  Factor and no task requires `cleanup`.

## Concepts

- `destructors`: the disposable class, the `dispose`/`dispose*`
  generic split, and the four scoped combinators
  (`with-disposal`, `with-destructors`, `&dispose`, `|dispose`).

## Prerequisites

- `tuples` — taught in `role-playing-game`. Task 5 defines a
  `TUPLE: ... < disposable ...` subclass with a slot.
- `errors` — taught in `factory-failsafe`. Tasks 4 motivates
  `|dispose` by having the quotation `throw`; the test asserts
  the pump is released only on the failure path.
- `generics` — taught in `bering-bearings`. Task 5 requires
  writing an `M: valve dispose*` method.
- `combinators` — taught in `joiners-journey`. `with-disposal`,
  `with-destructors`, and `pump-out` are scoped combinators;
  fluency with quotation-taking words is a prerequisite.

## Why this exists

`telegraphers-tape` currently teaches the streams protocol,
the disposable framework, *and* the scoped-cleanup combinators
in one introduction. Splitting destructors off (and gating
telegraphers on it) lets each exercise focus on one concept and
trims telegraphers' introduction roughly in half.

The task ramp also doubles as a preview: by the end of
`boatswains-bilge`, the student has already built one custom
disposable. `telegraphers-tape` then layers the stream protocol
on top of skills the student just rehearsed.

[destructors]: https://docs.factorcode.org/content/vocab-destructors.html
