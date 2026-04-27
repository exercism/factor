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
find   ( seq quot -- i/f elt/f ) ! first match: index and element, or f f
```

```factor
{ 1 2 3 4 5 } [ even? ] filter .    ! => { 2 4 }
{ 1 2 3 4 5 } [ even? ] reject .    ! => { 1 3 5 }
{ 1 2 3 4 5 } [ 3 > ] find .s
! => 3            (index)
! => 4            (element)
```

## Mapping and iterating

`map` (in [`sequences`][sequences]) applies a quotation to each
element and returns the array of results. `each` does the same
walk but discards the results — useful when the quotation runs
purely for its side effects:

```
map  ( seq quot -- newseq )
each ( seq quot -- )
```

```factor
{ 1 2 3 } [ sq ] map .       ! => { 1 4 9 }
{ 1 2 3 } [ . ] each         ! prints 1, then 2, then 3
```

## Sorting

`sort` returns a sorted copy in natural order; `sort-by` (in
[`sorting`][sorting]) sorts by a key extracted from each element:

```
sort    ( seq      -- sortedseq )
sort-by ( seq quot -- sortedseq )
```

```factor
{ 3 1 4 1 5 9 2 6 } sort .
! => { 1 1 2 3 4 5 6 9 }

{ -3 5 -1 4 } [ abs ] sort-by .
! => { -1 -3 4 5 }
```

## Aggregating

`reduce` folds a sequence with a starting value and a
two-argument quotation; it is the general form of `sum`,
`map-sum`, and friends. `map-sum` (in
[`math.statistics`][math.statistics]) maps a quotation across the
sequence and sums the results in one pass.

```
reduce  ( seq init quot -- result )
map-sum ( seq      quot -- n      )
```

```factor
{ 1 2 3 4 } 0 [ + ] reduce .       ! => 10
{ 1 2 3 4 } 1 [ * ] reduce .       ! => 24
{ 1 2 3 4 }   [ sq ] map-sum .     ! => 30
```

## Min and max

`infimum` and `supremum` return the smallest or largest element
of a sequence outright. `infimum-by` and `supremum-by` (all in
[`math.statistics`][math.statistics]) return the element whose
extracted key is smallest or largest:

```
infimum     ( seq      -- elt )
supremum    ( seq      -- elt )
infimum-by  ( seq quot -- elt )
supremum-by ( seq quot -- elt )
```

```factor
{ 3 1 4 1 5 9 2 6 } infimum .       ! => 1
{ 3 1 4 1 5 9 2 6 } supremum .      ! => 9

{ -3 5 -1 4 } [ abs ] infimum-by .
! => -1
```

## Pulling the second element

For a 2-element array, `second` returns its second element. `first`
returns the first. Both are in [`sequences`][sequences].

## Numbers to strings

`number>string ( n -- str )` (in [`math.parser`][math.parser])
turns a number into its decimal-string form:

```factor
42 number>string .     ! => "42"
3.5 number>string .    ! => "3.5"
```

[backyard-birdwatcher]: https://exercism.org/tracks/factor/exercises/backyard-birdwatcher
[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
[sorting]: https://docs.factorcode.org/content/vocab-sorting.html
[math.statistics]: https://docs.factorcode.org/content/vocab-math.statistics.html
[math.parser]: https://docs.factorcode.org/content/vocab-math.parser.html
