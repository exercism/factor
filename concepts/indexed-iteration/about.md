# About

When walking a sequence, sometimes the element alone isn't
enough — you need the position too. Factor's *indexed* iteration
words give the per-element quotation both, with the index on top
of the stack. `times` is the related word for counted iteration
without an underlying sequence.

```factor
USING: io kernel math.parser sequences ;

! map-index: build a new sequence; quot sees ( elt index )
{ "alice" "bob" "carol" }
[ number>string ": " glue ] map-index .
! => { "alice: 0" "bob: 1" "carol: 2" }

! each-index: for side effect; quot sees ( elt index )
{ "alice" "bob" } [
    number>string ": " glue print
] each-index
! prints alice: 0
! prints bob: 1

! times: run a quotation N times
3 [ "tick " print ] times
```

| word         | effect                                                               |
|--------------|----------------------------------------------------------------------|
| `each-index` | `( seq quot: ( elt index -- ) -- )`                                  |
| `map-index`  | `( seq quot: ( elt index -- newelt ) -- newseq )`                    |
| `times`      | `( n quot: ( -- ) -- )` — but see below                              |

A subtlety on `times`: although its quotation is documented as
`( -- )`, the word is `inline`, so an effect-balanced quotation
like `( str -- str )` works fine and threads the stack across
iterations. That gives you a counted accumulator without any
mutable state:

```factor
USING: kernel sequences ;

"" 3 [ "clop " append ] times .    ! => "clop clop clop "
```

The same trick works for `each-index` and `map-index`: the
declared per-element effect is a *minimum*, not a maximum.
