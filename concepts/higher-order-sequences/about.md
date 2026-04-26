# About

Factor's sequence library leans heavily on *quotations* — code in
`[ ]` brackets — to parameterise iteration. The shape is always the
same: pass a sequence and a quotation, and the higher-order word
runs the quotation against each element.

```factor
{ 1 2 3 4 5 } [ even? ] filter .   ! => { 2 4 }
{ 1 2 3 4 5 } [ sq ] map .         ! => { 1 4 9 16 25 }
{ 1 2 3 4 5 } [ + ] reduce .       ! requires an identity:
0 { 1 2 3 4 5 } [ + ] reduce .     ! => 15
```

Beyond the core sequence ops:

| vocab              | provides                                      |
|--------------------|-----------------------------------------------|
| `sorting`          | `sort-by`, `natural-sort`                     |
| `math.statistics`  | `sum`, `map-sum`, `infimum-by`, `supremum-by` |
| `grouping`         | `group`, `clump`, `monotonic-split`           |

Pairs (`bi`, `tri`) and "n-ary" combinators (`2map`, `2each`) extend
the same pattern when the quotation needs more than one input.
