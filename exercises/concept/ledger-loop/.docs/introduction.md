# Introduction

Sometimes you want to combine a sequence into a single value;
sometimes you want to see *every intermediate value* the
combination produces along the way. Factor splits these into two
tools: `reduce` for the single-value fold, and the cumulative
family in [`math.statistics`][math.statistics] for the running
form.

## `reduce` — the general fold

```
reduce ( seq init quot: ( prev elt -- next ) -- result )
```

`reduce` walks a sequence, threading an accumulator through a
two-argument quotation. The quotation receives the running
accumulator and the next element; whatever it leaves on the
stack becomes the new accumulator.

```factor
USING: math sequences ;

{ 1 2 3 4 } 0 [ + ] reduce .         ! => 10
{ 1 2 3 4 } 1 [ * ] reduce .         ! => 24
```

A non-zero seed and a custom combiner are the parts of `reduce`
that `sum` and `product` cannot reach. For example, threading a
per-step floor:

```factor
100 { 50 -200 30 } [ + 0 max ] reduce .   ! => 30
```

`100 + 50 = 150`; `150 + (-200) = -50`, floored to `0`;
`0 + 30 = 30`. The floor applies at each step, so `sum +` would
give the wrong answer (`-20`).

## Cumulative reductions

Sometimes you want every intermediate result, not just the
final one. The cumulative family in
[`math.statistics`][math.statistics] returns a sequence the same
length as the input, where each position is the reduction over
the prefix ending at that position:

```
cum-sum     ( seq -- newseq )    ! running total
cum-product ( seq -- newseq )    ! running product
cum-min     ( seq -- newseq )    ! running minimum
cum-max     ( seq -- newseq )    ! running maximum
```

```factor
USING: math.statistics ;

{ 3 1 4 1 5 9 2 6 } cum-sum .        ! => { 3 4 8 9 14 23 25 31 }
{ 1 2 3 4 } cum-product .            ! => { 1 2 6 24 }
{ 3 1 4 1 5 9 2 6 } cum-min .        ! => { 3 1 1 1 1 1 1 1 }
{ 3 1 4 1 5 9 2 6 } cum-max .        ! => { 3 3 4 4 5 9 9 9 }
```

A useful pattern is **chained** cumulative reductions: feed the
output of one into another to get a running summary of a
running summary. For example, taking `cum-min` of the running
totals tells you the worst running total seen so far at each
position.

[math.statistics]: https://docs.factorcode.org/content/vocab-math.statistics.html
