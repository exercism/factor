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
length   ( seq -- n   )
first    ( seq -- elt )
rest     ( seq -- tailseq )    ! everything but the first element
last     ( seq -- elt )
but-last ( seq -- headseq )    ! everything but the last element
nth      ( n seq -- elt )      ! 0-based
```

```factor
{ 10 20 30 } length .       ! => 3
{ 10 20 30 } first .        ! => 10
{ 10 20 30 } rest .         ! => { 20 30 }
{ 10 20 30 } last .         ! => 30
{ 10 20 30 } but-last .     ! => { 10 20 }
1 { 10 20 30 } nth .        ! => 20
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

## Padding

```
pad-head ( seq n elt -- padded )    ! prepend copies of elt
pad-tail ( seq n elt -- padded )    ! append copies of elt
```

Both extend `seq` until its length is at least `n`. If `seq` is
already that long, it is returned unchanged.

```factor
{ 2 5 0 } 6 0 pad-tail .   ! => { 2 5 0 0 0 0 }
{ 4 1 } 5 9 pad-head .     ! => { 9 9 9 4 1 }
```

## The same words work on strings

A string is a sequence of characters, so everything above works on
strings too — the result is just another string instead of an array:

```factor
"hello" length .            ! => 5
"hello" 3 head .             ! => "hel"
"abc" 6 CHAR: . pad-tail .   ! => "abc..."
```

## Aggregating

`sum` and `product` (in [`math.statistics`][math.statistics])
add or multiply the elements of a numeric sequence:

```factor
{ 2 5 0 7 } sum .        ! => 14
{ 2 5 3 7 } product .    ! => 210
```

`count` runs a predicate over the sequence and returns how many
elements made it true:

```
count ( seq quot -- n )
```

```factor
{ 2 5 0 7 4 1 } [ even? ] count .    ! => 3
```

## Predicates over the whole sequence

```
any?   ( seq quot -- ? )
all?   ( seq quot -- ? )
empty? ( seq -- ? )
```

```factor
{ 2 5 0 7 } [ 4 > ] any? .      ! => t
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
{ 10 20 30 } unclip-last 2 * suffix .
! => { 10 20 60 }
```

## Coercing between sequence types

`>array`, `>vector`, and `>string` (in [`arrays`][arrays] and
the corresponding vocabularies) force a sequence into a
particular concrete type. Useful when an operation returned a
slice or generic sequence and you need an array (or string)
back.

```factor
{ 1 2 3 } 1 tail >array .   ! => { 2 3 }
"hello" >array .            ! => { 104 101 108 108 111 }
{ 65 66 67 } >string .      ! => "ABC"
```

[arrays]: https://docs.factorcode.org/content/vocab-arrays.html
[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
[math.statistics]: https://docs.factorcode.org/content/vocab-math.statistics.html
