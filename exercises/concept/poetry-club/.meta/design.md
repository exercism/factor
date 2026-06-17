# Design

## Goal

Introduce Factor's `disjoint-sets` vocabulary: building a disjoint set,
adding atoms, merging groups with `equate`, and identifying a group by
its `representative`.

## Learning objectives

- Build an empty disjoint set with `<disjoint-set>` and register atoms
  with `add-atoms`.
- Merge two groups with `equate`, understanding that the structure is
  mutated in place.
- Look up a group's canonical member with `representative`.
- Test whether two atoms share a group by comparing their
  representatives.

## Out of scope

- The built-in `equiv?` predicate (the exercise deliberately compares
  representatives instead).
- `disjoint-set-members` and the internal union-by-rank /
  path-compression machinery.
- Building a disjoint set over non-trivial atom types or association
  structures.

## Concepts

- `disjoint-sets`.

## Prerequisites

- `words` — taught in `lasagna`.
- `combinators` — taught in `joiners-journey` (`keep` and `bi@` for
  threading the disjoint set on the stack).
- `curry-compose-fry` — taught in `coordinate-choreography` (`curry`
  to bind the club into a per-poet lookup).
