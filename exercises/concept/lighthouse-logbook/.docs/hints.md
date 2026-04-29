# Hints

## 1. `empty-log`

- `HS{ }` is the empty literal, but it's *shared* — clone it.

## 2. `sight`

- One word from `sets`: the destructive insert.

## 3. `seen?`

- `in?` is the set-protocol membership test. It's the O(1)
  hash lookup, distinct from `member?`'s linear scan over a
  sequence.

## 4. `forget-sighting`

- One word from `sets`: the destructive remove.

## 5. `unique-count`

- `cardinality` returns the size of a set.

## 6. `reachable`

- This is a textbook breadth-first search.
- Maintain two mutable structures: a `HS{ }` for visited
  lighthouses (so you don't process anyone twice) and a `V{ }`
  acting as a frontier queue (`push` to enqueue, `pop` to
  dequeue).
- Seed both with `start`. Then `while` the frontier is
  non-empty, dequeue one lighthouse, look up its neighbours in
  `relay-map` (using `at`), and for each neighbour that isn't
  yet in `visited`, `adjoin` it to `visited` and `push` it onto
  the frontier.
- Return `visited`.
- Locals (`::` and `:>`) keep this readable; use them for
  `visited`, `frontier`, and the per-iteration neighbour lookup.
