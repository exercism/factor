# Introduction

Most data in Factor lives in *sequences*. Arrays, vectors, and
strings are all sequences and share a common set of words from the
[`sequences`][sequences] vocabulary.

## Array literals

A literal array uses `{ }` with whitespace between elements:

```factor
{ 1 2 3 } .          ! => { 1 2 3 }
{ "a" "b" "c" } .    ! => { "a" "b" "c" }
```

Arrays are read-only — words like `suffix` and `remove-nth` return
a *new* sequence rather than mutating the original.

## Length and indexing

```
length ( seq -- n )
first  ( seq -- elt )
last   ( seq -- elt )
nth    ( n seq -- elt )    ! 0-based
```

```factor
{ 10 20 30 } length .    ! => 3
{ 10 20 30 } first .     ! => 10
{ 10 20 30 } last .      ! => 30
1 { 10 20 30 } nth .     ! => 20
```

## Slicing

```
head ( seq n -- headseq )    ! first n elements
tail ( seq n -- tailseq )    ! drop first n
```

```factor
{ 1 2 3 4 5 } 3 head .   ! => { 1 2 3 }
{ 1 2 3 4 5 } 3 tail .   ! => { 4 5 }
```

## Aggregating

`sum` (in [`math.statistics`][math.statistics]) adds the elements of
a numeric sequence:

```factor
{ 2 5 0 7 } sum .    ! => 14
```

`count` runs a predicate over the sequence and returns how many
elements made it true:

```
count ( seq quot -- n )
```

```factor
{ 2 5 0 7 4 1 } [ 5 >= ] count .    ! => 2
```

## Predicates over the whole sequence

```
any?   ( seq quot -- ? )
all?   ( seq quot -- ? )
empty? ( seq -- ? )
```

```factor
{ 2 5 0 7 } [ zero? ] any? .    ! => t
{ 2 5 0 7 } [ 0 > ] all? .      ! => f
```

## Building a new sequence

`unclip-last` peels the final element off a sequence; `suffix` adds
one to the end. Combining them gives a non-destructive update of the
last element:

```
unclip-last ( seq -- butlast last )
suffix      ( seq elt -- newseq )
```

```factor
{ 2 5 0 7 4 1 } unclip-last 1 + suffix .
! => { 2 5 0 7 4 2 }
```

[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
[math.statistics]: https://docs.factorcode.org/content/vocab-math.statistics.html
