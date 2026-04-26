# Hints

## General

- The price of an item is the second element of its 2-array. `second`
  in [`sequences`][sequences] reads it.
- Higher-order words like `filter`, `count`, `sort-by`, and `map-sum`
  all take a *quotation* — code in `[ ]` brackets — as their second
  argument.

## 1. Sort the inventory by price

- `sort-by` (in [`sorting`][sorting]) takes a sequence and a quotation
  that returns a sortable key for each element.

## 2. Find items with no price set

- A missing price is `f`. `f` is also Factor's only falsy value, so
  `[ second not ] filter` keeps items whose price is `f`.
- `[ second ] reject` does the same thing the other way round.

## 3. Count expensive items

- `count` runs the predicate on each element and tallies the matches.

## 4. Find the cheapest item

- `infimum-by` (in [`math.statistics`][math.statistics]) returns the
  element whose extracted key is smallest.

## 5. Sum all the prices

- `map-sum` (also in `math.statistics`) maps a quotation across the
  sequence and sums the results.

[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
[sorting]: https://docs.factorcode.org/content/vocab-sorting.html
[math.statistics]: https://docs.factorcode.org/content/vocab-math.statistics.html
