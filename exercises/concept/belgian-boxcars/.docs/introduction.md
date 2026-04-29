# Introduction

Sometimes you need to view a sequence as a series of *pieces*
rather than element-by-element. The
[`grouping`][grouping] and [`splitting`][splitting] vocabularies
give you four ways to do that.

## `group` — disjoint chunks of size *n*

```
group ( seq n -- groups )
```

```factor
USING: grouping ;

{ 1 2 3 4 5 6 7 } 3 group .
! => { { 1 2 3 } { 4 5 6 } { 7 } }
```

If the sequence length isn't a multiple of *n*, the final group
is shorter than *n*.

## `clump` — overlapping sliding window of size *n*

```
clump ( seq n -- clumps )
```

```factor
USING: grouping ;

{ 1 2 3 4 5 } 2 clump .
! => { { 1 2 } { 2 3 } { 3 4 } { 4 5 } }
```

If the sequence is shorter than *n*, the result is empty.

## `split-when` — break wherever a predicate fires

```
split-when ( seq quot: ( elt -- ? ) -- pieces )
```

```factor
USING: splitting ;

{ 1 2 0 3 4 0 5 } [ zero? ] split-when .
! => { { 1 2 } { 3 4 } { 5 } }
```

Each element gets its own predicate call; truthy elements are
the *break points* and aren't kept in the result.

## `monotonic-split` — break runs where an adjacent-pair check fails

```
monotonic-split ( seq quot: ( a b -- ? ) -- pieces )
```

```factor
USING: splitting.monotonic ;

{ 1 1 2 2 2 3 } [ = ] monotonic-split .
! => { { 1 1 } { 2 2 2 } { 3 } }
```

The predicate runs on *adjacent pairs*. While it returns truthy,
the run continues; when it returns `f`, a new piece starts. With
`[ = ]` you get runs of equal elements; with `[ <= ]` you get
non-decreasing runs; and so on.

## When to reach for which

- **`group`/`clump`**: you know the *size* you want.
- **`split-when`**: you know what a *break element* looks like.
- **`monotonic-split`**: you know what makes two adjacent
  elements *still belong together*.

[grouping]: https://docs.factorcode.org/content/vocab-grouping.html
[splitting]: https://docs.factorcode.org/content/vocab-splitting.html
