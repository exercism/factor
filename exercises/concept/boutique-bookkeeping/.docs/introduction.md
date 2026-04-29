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
find      ( seq quot    -- i/f elt/f ) ! first match: index and element, or f f
find-last ( seq quot    -- i/f elt/f ) ! same, but searches from the end
filter    ( seq quot    -- newseq )    ! keep elements where quot is truthy
reject    ( seq quot    -- newseq )    ! drop them instead
without   ( seq exclude -- newseq )    ! drop every element that's in `exclude`
```

```factor
{ 1 2 3 4 5 } [ 3 > ] find .s
! => 3            (index)
! => 4            (element)
{ 1 2 3 4 5 } [ 3 > ] find-last .s
! => 4            (index)
! => 5            (element)
{ 1 2 3 4 5 } [ even? ] filter .    ! => { 2 4 }
{ 1 2 3 4 5 } [ even? ] reject .    ! => { 1 3 5 }
"hello world" " ld" without .       ! => "heowor"
```

`without` treats its second argument as a set: any element of
`seq` that's `=` to *any* element of `exclude` is dropped.

## Threading a fixed value with `with`

Sometimes the predicate needs a value that's the same on every
call — a threshold, a divisor, a target string. `with` (in
[`kernel`][kernel]) bakes that fixed value into the quotation,
turning a two-argument quotation `( value elt -- ? )` into the
one-argument quotation that `filter`, `count`, `map`, and `each`
expect:

```
with ( value seq quot -- seq curry )
```

Every per-element call sees `( value elt )` on the stack —
fixed value first, current element second:

```factor
USING: kernel sequences ;

! Count elements greater than 5 — value=5 is threaded in
5 { 2 7 4 9 1 8 } [ < ] with count .   ! => 3
```

## Mapping and iterating

`map` (in [`sequences`][sequences]) applies a quotation to each
element and returns the array of results. `each` does the same
walk but discards the results — useful when the quotation runs
purely for its side effects. `2map` walks *two* sequences in
lockstep and combines corresponding elements; `zip` is the
shorthand for "pair them up without combining":

```
map  ( seq       quot -- newseq )
each ( seq       quot -- )
2map ( seq1 seq2 quot -- newseq )
zip  ( seq1 seq2      -- pairs )
```

```factor
USING: formatting math sequences ;

{ 1 2 3 } [ sq ] map .                         ! => { 1 4 9 }
{ 1 2 3 } [ . ] each                           ! prints 1, then 2, then 3
{ 1 2 3 } { 10 20 30 } [ + ] 2map .            ! => { 11 22 33 }
{ "x" "y" } { 1 2 } [ "%s%d" sprintf ] 2map .  ! => { "x1" "y2" }
{ "a" "b" "c" } { 1 2 3 } zip .                ! => { { "a" 1 } { "b" 2 } { "c" 3 } }
```

Both two-sequence forms stop at the length of the shorter
input. `zip` is the same as `[ 2array ] 2map` — pair-keeping
rather than pair-collapsing.

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

`map-sum` (in [`math.statistics`][math.statistics]) maps a
quotation across the sequence and sums the results in one pass:

```
map-sum ( seq quot -- n )
```

```factor
{ 1 2 3 4 } [ sq ] map-sum .   ! => 30
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

## Writing your own higher-order word

When *your* word takes a quotation as a runtime argument and
forwards it to `map`, `filter`, `each`, etc., declare your word
with `; inline`. That tells the compiler to inline your word at
each call site, where the quotation is a known literal — without
it, the compiler has no way to know the quotation's stack effect.

```factor
USING: math.statistics sequences ;

: tax-on ( inventory quot -- total )
    map-sum ; inline

{ { "shirt" 20 } { "hat" 15 } } [ second 1/10 * ] tax-on .
! => 7/2
```

Words built only from literal quotations don't need `inline` —
just the ones that pass an *incoming* quotation through.

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
[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
[sorting]: https://docs.factorcode.org/content/vocab-sorting.html
[math.statistics]: https://docs.factorcode.org/content/vocab-math.statistics.html
[math.parser]: https://docs.factorcode.org/content/vocab-math.parser.html
