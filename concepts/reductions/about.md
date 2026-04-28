# About

`reduce` is Factor's general fold: it walks a sequence,
threading an accumulator through a binary quotation that takes
the running accumulator and the next element and produces the
new accumulator.

```
reduce ( seq init quot: ( prev elt -- next ) -- result )
```

```factor
USING: math sequences ;

{ 1 2 3 4 } 0 [ + ] reduce .         ! => 10
{ 1 2 3 4 } 1 [ * ] reduce .         ! => 24
```

A custom seed lets `reduce` express folds that `sum` or `product`
cannot. For example, applying a per-step floor:

```factor
100 { 50 -200 30 } [ + 0 max ] reduce .   ! => 30
```

(`100 + 50 = 150`; `150 + (-200) = -50`, floored to `0`;
`0 + 30 = 30`.) The floor at each step matters — `sum +` would
produce `-20`.

## Cumulative reductions

The cumulative family in [`math.statistics`][math.statistics]
returns a sequence of the same length as the input, where each
element is the reduction over the prefix up to and including that
position:

| word          | running operation |
|---------------|-------------------|
| `cum-sum`     | running total      |
| `cum-product` | running product    |
| `cum-min`     | running minimum    |
| `cum-max`     | running maximum    |

```factor
USING: math.statistics ;

{ 3 1 4 1 5 9 2 6 } cum-sum .         ! => { 3 4 8 9 14 23 25 31 }
{ 3 1 4 1 5 9 2 6 } cum-min .         ! => { 3 1 1 1 1 1 1 1 }
{ 3 1 4 1 5 9 2 6 } cum-max .         ! => { 3 3 4 4 5 9 9 9 }
```

Cumulative reductions are useful when you want to inspect *how*
a quantity evolved across the sequence, not only its final value
— running balances, peak watermarks, low watermarks, and so on.

[math.statistics]: https://docs.factorcode.org/content/vocab-math.statistics.html
