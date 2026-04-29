# Design

## Goal

Introduce mutable hash-sets and the canonical BFS pattern that
combines a hash-set (visited) with a hashtable (adjacency map).

## Learning objectives

- Build a fresh mutable hash-set with `HS{ } clone`.
- Insert, remove, test, and count with `adjoin`, `delete`,
  `in?`, `cardinality`.
- Distinguish `in?` (O(1) hash lookup) from `member?` (linear
  scan over a sequence).
- Combine a hash-set with a hashtable to perform a graph
  traversal — the textbook visited-set + frontier-queue
  pattern.

## Out of scope

- The non-hash set implementations.
- `union`/`intersect`/`diff` as combinators in tasks (mentioned
  in the introduction only).
- Persistent / immutable set semantics.

## Concepts

- `hash-sets`: mutable hash-set operations and the visited-set
  pattern.

## Prerequisites

- `assocs` — taught in `storeroom-stocktake`. Needed for the
  hashtable adjacency map in task 6.
- `mutation` — taught in `mosaic-mischief`. Needed for the
  vector queue (`push`/`pop`) in task 6.
- `locals` — taught in `lasagna-luminary`. Needed to keep the
  BFS body readable.
- `while` — taught in `mixed-juices`. Needed for the BFS loop.
