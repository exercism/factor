# Hints

## General

- `<dlist>` is in [`dlists`][dlists]; the push/pop words are in
  [`deques`][deques].
- `MEMO:` is in [`memoize`][memoize].
- Locals (`::` and `:>`) keep the BFS body readable; the
  predicate sees the same locals as the body.

## 1. Drain the tide queue

- Start with `<dlist>`, `[ push-back ] each` to fill it, then a
  `while` loop that pops the front until the deque is empty,
  accumulating into a `V{ } clone` and converting to an array
  at the end with `>array`.

## 2. Coves reachable

- Pattern: `HS{ } clone` for `visited`, `<dlist>` for
  `frontier`, mark `start` visited and push it onto the
  frontier, then loop while the frontier isn't empty: pop the
  front, look up its neighbours in the chart with `at`, and for
  each unseen neighbour adjoin to `visited` and push-back onto
  the frontier.

## 3. Hop count

- Same shape as task 2, but the deque carries `{ cove distance }`
  pairs. When you pop a pair whose cove equals the goal, record
  the distance as the answer and stop. Use a mutable local
  (`f :> answer!`) and gate the loop on
  `frontier deque-empty? not answer not and`.

## 4. Gold count

- One declaration: `MEMO: gold-count ( cove -- n ) gold-distribution at 0 or ;`.
  `MEMO:` replaces the leading `:`; everything else is a normal
  word definition. `at` returns `f` when the key is missing;
  `0 or` substitutes zero.

## 5. Treasure route

- `coves-reachable` returns a hash-set; `members` (in `sets`)
  turns it into a sequence. Build an array of `{ gold cove }`
  pairs with `[ [ gold-count ] keep 2array ] map`, then `sort`
  the array (which orders pairs by their first element), and
  `last second` picks the cove of the highest-gold pair.

[deques]: https://docs.factorcode.org/content/vocab-deques.html
[dlists]: https://docs.factorcode.org/content/vocab-dlists.html
[memoize]: https://docs.factorcode.org/content/vocab-memoize.html
