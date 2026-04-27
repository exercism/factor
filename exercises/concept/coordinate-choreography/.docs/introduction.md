# Introduction

When a quotation needs to *remember* values from its surroundings —
what other languages call a *closure* — Factor uses two tools: the
`curry` word and the `'[ ]` *fry* syntax.

## `curry` — capturing one value

`curry` (in [`kernel`][kernel]) takes a value and a quotation and
returns a new quotation with that value baked in:

```
curry ( value quot -- newquot )
```

```factor
3 [ + ] curry .
! => [ 3 + ]

10 3 [ + ] curry call .
! => 13
```

Apply `curry` twice to capture two values:

```factor
2 3 [ + + ] curry curry .
! => [ 2 3 + + ]
```

## `compose` — joining two quotations

`compose` (in [`kernel`][kernel]) glues two quotations together:

```
compose ( quot1 quot2 -- quot )
```

```factor
[ 1 + ] [ 2 * ] compose .
! => [ 1 + 2 * ]

5 [ 1 + ] [ 2 * ] compose call .
! => 12
```

## Fry quotations — capturing several values

For more than one or two captures, chained `curry` calls become
hard to read. *Fry* uses `'[ … ]` with one or more `_` placeholders;
each `_` is replaced by a value taken off the data stack, in order:

```factor
2 3 '[ _ _ + + ] .
! => [ 2 3 + + ]
```

Fry also reaches *into* nested quotations, which lets you place the
captured values exactly where you want them:

```factor
3 '[ [ _ + ] map ] { 1 2 3 } swap call( s -- s ) .
! => { 4 5 6 }
```

## `call` with a declared effect

When you ultimately run a stored quotation, declare its stack effect
on `call` so the compiler can type-check it:

```factor
{ 1 2 } [ first2 + ] call( p -- n ) .
! => 3
```

## Vector arithmetic

The [`math.vectors`][math.vectors] vocabulary's `v+` and `v*` add or
multiply two same-length sequences element-wise. Both `{ a b }` and
`{ c d }` give back a 2-array:

```factor
{ 1 1 } { 3 4 } v+ .   ! => { 4 5 }
{ 2 5 } { 3 -1 } v* .  ! => { 6 -5 }
```

[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
[math.vectors]: https://docs.factorcode.org/content/vocab-math.vectors.html
