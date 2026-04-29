# Hints

## 1. `couple`

- One word from `grouping` does it: pick the disjoint-chunks
  one.

## 2. `peek-couplings`

- Sliding window of size 2 — the overlapping cousin of `group`.

## 3. `split-at-junctions`

- `split-when` takes a predicate `( elt -- ? )`. Inside it, you
  need to ask "is this car one of the junctions?" — that's
  `member?` against the `junctions` array.
- The `junctions` value is needed inside the per-element
  quotation, which means baking it in with `with` (already
  taught in `boutique-bookkeeping`).

## 4. `coalesce-cargo`

- `monotonic-split` takes a predicate over *adjacent pairs*
  `( a b -- ? )`. You want a run to continue while two adjacent
  cars carry the *same* cargo.
