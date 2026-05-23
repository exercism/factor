# Design

## Goal

Teach `streams` — implementing Factor's input-stream protocol on
a custom `disposable` class. The student wires up the four
methods that turn a tuple into a real, scoped, cleanup-aware
input stream.

## Concept introduced

`streams` — the stream protocol generics (`stream-read1`,
`stream-element-type`, …) and the `input-stream`/`output-stream`
mixins. The disposable framework (`new-disposable`, `dispose*`,
the scoped combinators) is taught upstream in `boatswains-bilge`
and assumed here.

## Prerequisite concepts

- `tuples` — for the `TUPLE: tape < disposable wire ;` declaration
- `generics` — `M:` methods plus `INSTANCE:` for the input-stream
  mixin
- `while` — the `stream-read1` body loops until it sees a Morse
  symbol or end-of-stream
- `sequences` — `member?` to test the Morse alphabet
- `vocabularies` — the stream protocol generics live in a
  separate vocab from the tuple, so the student gets practice
  picking the right `USING:` lines
- `destructors` — taught in `boatswains-bilge`. The student must
  already know `new-disposable`, `dispose*`, and the at-most-once
  semantics; this exercise only adds the *stream* protocol on top.
- `wire-format` — taught in `signalers-satchel`. Not load-bearing
  for the exemplar, but a sibling pre-streams exercise that gives
  the student practice with `unparse` and slice variants they'll
  reach for in real stream code.

## Why a filtering input stream

The wrap-and-pass-through shape is the simplest demonstration of
the stream protocol. By giving the wrapper a small *behavioural*
twist — drop everything that isn't a Morse symbol — the exercise
makes implementing `stream-read1` non-trivial without dragging
in OS resources or batch reads. The other four pieces
(`<tape>`, `INSTANCE:`, `stream-element-type`, `dispose*`) are
the structural boilerplate that comes with any custom stream;
the student learns the *whole* protocol by writing one
concrete instance.

## Tasks ramp

1. **Tuple + constructor** — TUPLE: subclass syntax and
   `new-disposable`. The fact that the framework registers the
   instance is the key hidden mechanic.
2. **`INSTANCE: tape input-stream`** — joins the mixin so default
   protocol methods dispatch to `tape`.
3. **`stream-read1`** — the only method with real logic. The
   loop motivates `while` and the Morse-symbol test motivates
   `member?` (or a `case`).
4. **`stream-element-type`** — the delegate pattern that any
   wrapper stream uses.
5. **`dispose*`** — the cleanup hook. Calling `dispose` on the
   wire (not `dispose*`) reinforces the public/internal
   distinction.

## Why end with `dispose*`

The student writes a constructor that registers the stream
*before* they implement the method that disposes of it; the
framework will leak resources until step 5 closes the loop.
That's a useful narrative: the destructor framework is doing
its half of the bargain even when the cleanup hook is empty,
and adding `dispose*` is what makes the resource truly safe.
