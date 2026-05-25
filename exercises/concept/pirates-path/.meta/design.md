# Design

## Goal

Teach Factor's `<dlist>` and the deque protocol through a
textbook BFS problem, and introduce `MEMO:` as the small
caching declaration that pairs naturally with expensive
graph-traversal helpers. By the end the student has built the
canonical "deque frontier + hash-set visited + memoised
neighbour function" pattern from the ground up.

## Learning objectives

- Construct a `<dlist>` and use `push-back` / `pop-front` for
  FIFO semantics.
- Distinguish FIFO (deque queue) from LIFO (vector stack) and
  recognise BFS as the canonical FIFO case.
- Write a BFS over a hashtable adjacency map: deque frontier,
  hash-set visited.
- Carry per-node side data (distance) in the deque entries.
- Declare a word with `MEMO:` for automatic result caching.
- Compose smaller graph words into a larger query (treasure
  selection).

## Out of scope

- Weighted graphs / Dijkstra / A*.
- Bidirectional BFS.
- Path *reconstruction* (returning the actual sequence of
  coves) — kept to hop *count* for tractable test outputs.
- `MEMO:` cache eviction, `recall`, or other introspection — the
  one declaration is the lesson, and the cache lives for the
  image's lifetime.
- The deque protocol's full generic-dispatch story (other
  classes that implement `push-front` etc.).

## Concepts

- `deques`: the `<dlist>` constructor, the four push/pop words,
  and the FIFO-as-BFS-frontier pattern. `MEMO:` is taught in the
  introduction as a supporting feature for caching the
  neighbour-lookup style of word the BFS calls.

## Prerequisites

- `hash-sets` — taught in `lighthouse-logbook`. The visited set
  is the dedup engine; the student already knows `adjoin`,
  `in?`, `members`.
- `assocs` — taught in `pursers-pantry`. The chart is a
  hashtable keyed on cove name; the student uses `at` to look
  up neighbours.
- `locals` — taught in `lasagna-luminary`. `::` and `:>` keep
  the multi-state BFS body readable.
- `until` — taught in `mixed-juices`. The BFS loop.

## Tasks ramp

1. **`tide-queue`** — pure deque mechanics. Push everything
   onto a `<dlist>`, then drain. No algorithm; just FIFO
   demonstrated.
2. **`coves-reachable`** — first BFS. Returns the visited set.
   This is the canonical pattern with no special-case logic.
3. **`hop-count`** — same shape with one twist: the frontier
   carries pairs of `(cove, distance)`, and the loop terminates
   early on a goal match.
4. **`gold-count`** — single-line `MEMO:` declaration over a
   `CONSTANT:` lookup. Introduces caching.
5. **`treasure-route`** — integration: combine `coves-reachable`
   with `gold-count` and pick the maximum. The memoisation pays
   off when several callers consult the same cove.

## Why dlist (not vector-as-stack)

`lighthouse-logbook`'s `reachable` used a vector as a LIFO
stack — fine for "is this node reachable?" since order is
irrelevant. `hop-count` is different: BFS *order* (closest first)
is the source of the shortest-path property, and that requires
FIFO at both ends in O(1), which is exactly `<dlist>`'s niche.

## Why memoization here

Memoisation alone is too thin for its own exercise — one
declaration, one behaviour. But it lands naturally in a graph
problem: `gold-count` might be a real database lookup or a
heavy computation, and a single chart's BFS-driven analysis
typically asks about the same cove many times. The pairing
shows `MEMO:` as a tool you reach for, not a feature to learn
in the abstract.

## Why `connect` gains this as a prereq

The track's practice exercise `connect` (Hex board path-finding)
is a direct application of BFS-with-deque. Until now it could
only nod at `hash-sets` and `mutation`; with `deques` taught,
its prereq list reflects the algorithm students actually need.
