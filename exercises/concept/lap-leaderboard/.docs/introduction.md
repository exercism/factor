# Introduction

Sometimes when you walk a sequence, you need the element's
*position* alongside the element itself. The `*-index` family
in [`sequences`][sequences] hands both to the per-element
quotation. `times` is the close cousin for plain counted
iteration — useful when you only need a tally, not a sequence.

## `each-index` and `map-index` — index in the quotation

```
each-index ( seq quot: ( elt index -- )       -- )
map-index  ( seq quot: ( elt index -- newelt ) -- newseq )
```

The quotation receives the element below the index — `index`
is on **top** of the stack:

```factor
USING: io kernel math.parser sequences ;

{ "alice" "bob" "carol" } [
    number>string ": " glue print
] each-index
! prints:
! alice: 0
! bob:   1
! carol: 2

{ 10 20 30 } [ + ] map-index .
! => { 10 21 32 }       (index added to each element)
```

`each-index` runs the quotation for its side effect and
returns nothing. `map-index` collects the per-element results
into a new sequence of the same kind as the input.

## `times` — counted iteration

```
times ( n quot: ( -- ) -- )
```

`times` runs its quotation `n` times. The published `( -- )`
shape is the *minimum* — because `times` is `inline`, an
effect-balanced quotation like `( str -- str )` works fine, and
the stack is threaded across iterations. That gives you a
counted accumulator without any mutable state:

```factor
USING: kernel sequences ;

"" 3 [ "clop " append ] times .    ! => "clop clop clop "
```

Each iteration's body sees the running string, appends to it,
and leaves the new string on the stack for the next iteration.
The same trick works for `each-index` and `map-index` when you
want to thread an accumulator through.

[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
