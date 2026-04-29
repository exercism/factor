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
cannot. For example, the largest value in a sequence with a
default if every element loses:

```factor
USING: math.order ;

{ 3 1 -4 5 -2 } 0 [ max ] reduce .   ! => 5
{ -3 -1 -4 }    0 [ max ] reduce .   ! => 0
```

The seed `0` participates in the comparison, so an all-negative
sequence still produces `0` rather than its smallest value.

## `produce` — the unfold

The dual of `reduce` is `produce` (in [`sequences`][sequences]):
where `reduce` *consumes* a sequence, `produce` *generates*
one. A predicate quotation tests the running state; while it
returns truthy, a body quotation produces the next element.

```
produce ( pred quot -- seq )
```

Used together, `reduce` and `produce` form Factor's fold/unfold
pair.

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
a quantity evolved across the sequence, not only its final
value. Chaining them is also useful: the output of one
cumulative is itself a sequence, ready to feed into another.

[math.statistics]: https://docs.factorcode.org/content/vocab-math.statistics.html
[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
