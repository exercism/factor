# Design

## Goal

Introduce Factor's standard concurrency toolkit — cooperative
threads, promises, the parallel-map combinator, and locks — by
having the student build up from a sequential per-crate
operation to a fork/join with a lock-protected shared tally.

## Learning objectives

- Use `parallel-map` for the high-level fork/join pattern.
- Use `<lock>` and `with-lock` to protect shared mutable state
  across threads.
- Use `spawn`, `<promise>`, `fulfill`, and `?promise` to
  hand-roll fork/join when the iteration shape doesn't fit
  `parallel-map`.
- Recognise that *reads* of shared state need synchronisation
  too, not just writes — a thread can yield mid-read.

## Out of scope

- Mailboxes, channels, semaphores — message-passing primitives
  for problems with a different shape than this one.
- Multi-process / distributed parallelism via
  `concurrency.distributed`.
- True multi-core parallelism (Factor's threads are
  cooperative on a single OS thread).
- Atomic CAS via `alien.atomic`.

## Concepts

- `concurrency`: cooperative threads, promises, parallel
  combinators, and locks.

## Prerequisites

- `higher-order-sequences` — taught in `boutique-bookkeeping`.
  `parallel-map` has the same shape as `map`, and the
  exemplar uses `each` and `map` for the dockhand fan-out.
- `tuples` — taught in `role-playing-game`. `TUPLE: crane`
  with named slots and the `change-tonnage` accessor are the
  obvious way to model a crane.
- `locals` — taught in `lasagna-luminary`. The hoist-crate
  body, and the per-crate dockhand spawn, are much clearer
  with `::` and `[| | … |]` than with bare stack shuffling.
