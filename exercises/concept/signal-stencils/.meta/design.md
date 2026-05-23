# Design

## Goal

Teach Factor's `MACRO:` declaration — the form whose body runs
at compile time, takes literal inputs from the call site, and
returns a quotation that's spliced in. This is the first
exercise on the track to introduce metaprogramming proper, and
the first Exercism concept exercise *anywhere* (clojure,
elixir, julia, lisps, scheme, racket, haskell, etc. all stop
short) to teach macro-writing.

## Learning objectives

- Read and write `MACRO:` declarations.
- Internalise the compile-time/runtime split: the macro body
  runs once at the call site's compile time; its returned
  quotation is what runs at runtime.
- Understand that macro inputs must be literals at the call
  site, not runtime values.
- Use ordinary sequence and quotation machinery (`append`,
  `concat`, `<repetition>`, `>quotation`, `curry`, `map`) to
  build result quotations.
- Recognise the contrast against Lisp `defmacro`: Factor's
  quotations are pre-resolved word sequences, so there is no
  hygiene problem and no `quote`/`unquote` ceremony.

## Out of scope

- `SYNTAX:` (parsing words) — a separate, much more involved
  metaprogramming layer that operates on tokens, not values.
- `functor:` — declarative template generation. Library-author
  territory.
- `MACRO::` (locals form) — mentioned in the about page only.
- `<< … >>` (compile-time evaluation blocks) — mentioned in the
  introduction in passing; not exercised. Useful when you need
  a compile-time *value* without the quotation-return contract.
- Macro hygiene mechanisms (`gensym`, etc.) — Factor doesn't
  need them; the about page explains why.

## Concepts

- `macros`: the `MACRO:` declaration form and the compile-time
  code-generation pattern. Built atop quotation manipulation,
  which is taught upstream.

## Prerequisites

- `quotations` — taught in `high-school-sweetheart`. Quotations
  are the macro's *output type*; the student must be fluent
  with `[ … ]` as a first-class value.
- `combinators` — taught in `joiners-journey`. `curry` and the
  quotation-shuffling combinators are the macro body's
  toolkit.
- `quotations-call` — taught in `rpn-calculator`. `>quotation`
  and the awareness that quotations are *callable sequences*.
- `sequences` — taught in `backyard-birdwatcher`. `concat`,
  `map`, `<repetition>`, `append` — the building blocks for
  the macro bodies.

## Tasks ramp

1. **`twice`** — the simplest macro: input is one quotation,
   output is that quotation concatenated with itself. Body is
   a single Factor word (`dup append`). Establishes the macro
   shape.
2. **`repeat-quot`** — generalises task 1 with a compile-time
   count. The input is a quotation *and* a literal number,
   demonstrating that macro inputs needn't be quotations.
3. **`compose-many`** — input is a literal array of
   quotations. The output's length depends on the input's
   length: first taste of structural code generation.
4. **`each-literal`** — input is a literal sequence and a
   quotation; the output is unrolled iteration. The compile-
   time sequence drives per-element code generation, and the
   `[ swap curry ] curry map concat >quotation` body is the
   densest macro shape in the exercise.

## Test file uses wrapper words

A macro can only be observed through the *runtime behaviour of
code it generates*. The test file therefore defines small
wrapper words that call the macros, then `unit-test`s those
wrappers. This is a departure from every other test file on
the track (which contain only `unit-test`/`must-fail-with`
calls). Future maintainers: the wrappers are deliberate test
fixtures, not stray code — leave them in place.

## Why no icon

The available icons in `icon-descriptions.md` don't have a
natural code-generation metaphor. `bering-bearings` set the
precedent of having no icon when none fits; this exercise
follows suit.

## Why pioneer this

No other Exercism track teaches macro-writing as a concept
exercise. Most tracks where macros are central (clojure,
elixir, julia, common-lisp) explicitly stop short — the
closest precedent is elixir's `ast` concept, which teaches
quoted expressions without going as far as `defmacro`. Factor
makes the lesson tractable because quotations *are* the AST:
no separate quote/unquote ceremony, no hygiene mechanism to
learn, just sequence manipulation that returns a quotation.
That conceptual simplification is what justifies the pioneer
move.
