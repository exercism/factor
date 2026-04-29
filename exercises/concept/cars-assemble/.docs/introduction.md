# Introduction

This exercise introduces conditionals — choosing between two or more
courses of action based on a value. It builds on the booleans you met
in [Annalyn's Infiltration][annalyns] and the integer arithmetic from
[Currency Conversion][currency-conversion].

## Comparison words

These all live in [`math`][math] (and `kernel` for `=`):

```
=  ( x y -- ? )    ! equal
<  ( x y -- ? )    ! less than
<= ( x y -- ? )    ! less than or equal
>  ( x y -- ? )    ! greater than
>= ( x y -- ? )    ! greater than or equal
```

```factor
3 3 = .     ! => t
2 3 < .     ! => t
3 3 <= .    ! => t
```

## `if`, `when`, `unless`

`if` (in [`kernel`][kernel]) takes a boolean and two quotations. It
runs the first quotation when the boolean is truthy and the second
when it is falsy:

```
if ( ? then-quot else-quot -- )
```

```factor
: abs ( x -- y ) dup 0 < [ neg ] [ ] if ;
```

`when` runs its quotation only when the boolean is truthy; `unless`
only when it is falsy:

```
when   ( ? quot -- )
unless ( ? quot -- )
```

## `if*`

`if*` is a variant of `if` that treats the boolean as a *value*
worth keeping when it's truthy — useful when a word returns "the
thing, or `f`". The truthy branch is called with the value still
on the stack; the falsy branch is called without it:

```
if* ( ? true false -- )
```

```factor
42 [ ] [ "nothing" ] if* .   ! prints 42
f  [ ] [ "nothing" ] if* .   ! prints "nothing"
```

## `cond`

When you have several alternative actions to choose between, `cond`
(in [`combinators`][combinators]) is the natural fit. It takes an
array of `{ predicate body }` pairs and runs the body of the first
predicate that yields a truthy value:

```factor
USING: combinators ;

: classify ( n -- label )
    {
        { [ dup 0 <  ] [ drop "negative" ] }
        { [ dup 0 =  ] [ drop "zero"     ] }
        [ drop "positive" ]
    } cond ;
```

A few details worth noting:

- The pairs are tried in order. The first match wins.
- An entry without a predicate (just a single quotation) at the end
  acts as the default.
- Each predicate inspects the input but should leave the data stack
  the way it found it — `dup ... <test>` is the usual idiom.
- The body of the chosen pair receives the same stack the predicate
  saw, so it usually starts by `drop`ping the input and pushing the
  result.

[annalyns]: https://exercism.org/tracks/factor/exercises/annalyns-infiltration
[currency-conversion]: https://exercism.org/tracks/factor/exercises/currency-conversion
[math]: https://docs.factorcode.org/content/vocab-math.html
[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
[combinators]: https://docs.factorcode.org/content/vocab-combinators.html
