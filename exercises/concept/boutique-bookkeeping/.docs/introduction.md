# Introduction

This exercise builds on what you saw in [Backyard Birdwatcher][backyard-birdwatcher]
by introducing the higher-order words that take a *quotation* — a
piece of code in `[ ]` brackets — to drive the operation.

## Quotations as values

A quotation is just a literal piece of code. You can pass one as
data to another word:

```factor
{ 1 2 3 4 5 } [ 2 > ] count .   ! => 3
```

Here `[ 2 > ]` is a quotation that takes a number and leaves a
boolean. `count` runs it on each element and tallies the truthy
results.

## Filtering and rejecting

```
filter ( seq quot -- newseq )    ! keep elements where quot is truthy
reject ( seq quot -- newseq )    ! drop them instead
```

```factor
{ 1 2 3 4 5 } [ even? ] filter .    ! => { 2 4 }
{ 1 2 3 4 5 } [ even? ] reject .    ! => { 1 3 5 }
```

## Mapping

`map` (in [`sequences`][sequences]) applies a quotation to each
element and returns the array of results:

```
map ( seq quot -- newseq )
```

```factor
{ 1 2 3 } [ sq ] map .    ! => { 1 4 9 }
```

## Sorting

`sort-by` (in [`sorting`][sorting]) sorts a sequence by a key
extracted from each element:

```
sort-by ( seq quot -- sortedseq )
```

```factor
{ { "a" 5 } { "b" 2 } { "c" 8 } } [ second ] sort-by .
! => { { "b" 2 } { "a" 5 } { "c" 8 } }
```

## Aggregating

`map-sum` (in [`math.statistics`][math.statistics]) maps a quotation
over a sequence and sums the results in one pass:

```
map-sum ( seq quot -- n )
```

```factor
{ { "a" 5 } { "b" 2 } { "c" 8 } } [ second ] map-sum .
! => 15
```

## Min and max by key

`infimum-by` and `supremum-by` (also in `math.statistics`) return the
element whose extracted key is smallest or largest:

```
infimum-by  ( seq quot -- elt )
supremum-by ( seq quot -- elt )
```

```factor
{ { "a" 5 } { "b" 2 } { "c" 8 } } [ second ] infimum-by .
! => { "b" 2 }
```

## Pulling the second element

For a 2-element array, `second` returns its second element. `first`
returns the first. Both are in [`sequences`][sequences].

[backyard-birdwatcher]: https://exercism.org/tracks/factor/exercises/backyard-birdwatcher
[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
[sorting]: https://docs.factorcode.org/content/vocab-sorting.html
[math.statistics]: https://docs.factorcode.org/content/vocab-math.statistics.html
