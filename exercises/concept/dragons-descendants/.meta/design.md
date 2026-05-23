# Design

## Goal

Teach Factor's tuple inheritance — the `TUPLE: child < parent
slots ;` syntax — as a *data* relationship: slots flow down,
accessors work on descendants, predicate classes nest. The
student arrives at `boatswains-bilge` already comfortable with
the `< disposable` syntax instead of pattern-matching it cold.

## Learning objectives

- Read and write `TUPLE: child < parent slots ;`.
- Predict the argument order of an inherited `boa` constructor
  (parent slots first, in declaration order, then own slots).
- Use a parent's accessors (`slot>>`, `>>slot`, `change-slot`)
  on any descendant.
- Reason about the predicate hierarchy — a `child` satisfies
  `parent?`, but not vice versa; siblings are disjoint.

## Out of scope

- Method dispatch on the hierarchy — taught in `generics`;
  exercised in `boatswains-bilge` (where the next concept
  exercise immediately demonstrates `M: valve dispose*`).
- `MIXIN:` and `INSTANCE:` — open multi-membership; introduced
  in passing inside `telegraphers-tape`'s streams intro.
- `PREDICATE:` classes — predicate-defined subclassing; a
  separate Factor feature, not on the track.
- Reflection (`superclass`, `class-of`, `slot-named`).

## Concepts

- `subclasses`: the `<` parent syntax, slot inheritance,
  accessor inheritance, and the predicate hierarchy.

## Prerequisites

- `tuples` — taught in `role-playing-game`. The student must
  know basic `TUPLE:` declarations, `boa`, slot names, and the
  literal syntax.
- `generics` — taught in `bering-bearings`. The intro forward-
  references method dispatch on the hierarchy; the student
  needs to know `GENERIC:` / `M:` already to make sense of the
  pointer.

## Tasks ramp

1. **`<dragon>`** — declare the base class with three slots and
   the `boa` constructor. No inheritance yet.
2. **`<fire-dragon>`** — first use of `<` — adds one slot. The
   constructor takes four arguments: three inherited, one new.
3. **`<ice-dragon>`** — a *sibling* of `fire-dragon`. Reinforces
   that subclasses of the same parent are disjoint
   (`ice-dragon?` is `f` for a `fire-dragon`).
4. **`<volcano-dragon>`** — *grandchild* via `< fire-dragon`.
   Demonstrates that inheritance is transitive: a
   `volcano-dragon` satisfies `dragon?`, `fire-dragon?`, and
   `volcano-dragon?`.
5. **`age-dragon`** — uses the parent's `change-age` accessor
   on any descendant. The payoff: a single word maintains every
   dragon's age regardless of which subclass.

## Why dragons (and not ships)

The track's nautical alliterative naming convention doesn't
have a natural inheritance metaphor — ship "classes" are
loosely hierarchical but the language varies (frigate, sloop,
brig). The available `dungeons-and-dragons` icon and the
"descendants" framing carry the inheritance metaphor cleanly,
which matters more than theme uniformity here.

## Why no method dispatch

Adding a `GENERIC: roar` with overrides on `dragon` /
`fire-dragon` would teach two concepts in one exercise — and
the very next exercise (`boatswains-bilge`) provides the
method-dispatch payoff in context (`M: valve dispose*` overrides
the framework's `dispose*` for the disposable hierarchy). The
data-only framing here keeps the prereq-check 1-concept-per-
exercise invariant clean and avoids restating generics
material.
