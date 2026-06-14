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

Both `curry` and fry *consume* their values from the stack the
moment the closure is built. The line above leaves nothing on the
stack and is a direct replacement for `[ + + ] curry curry`.

Placeholders are filled left-to-right with stack values
bottom-to-top: `2 3 '[ _ _ ]` is `[ 2 3 ]`, not `[ 3 2 ]`.

Fry also reaches *into* nested quotations, which lets you place the
captured values exactly where you want them:

```factor
2 '[ [ _ > ] filter ] { 1 2 3 4 5 } swap call( s -- s ) .
! => { 3 4 5 }
```

The `_` sits inside the inner `[ … ]`, but fry still fills it.

## `call` with a declared effect

When you ultimately run a stored quotation, declare its stack effect
on `call` so the compiler can type-check it:

```factor
{ 3 4 5 } [ first2 + ] call( p -- n ) .
! => 7

{ 3 4 5 } [ first ] call( p -- n ) .
! => 3
```

## Vector arithmetic

The [`math.vectors`][math.vectors] vocabulary combines two same-length
sequences element-wise. `v+` and `v*` add or multiply them; `vmax` and
`vmin` keep the larger or smaller of each component. Each gives back a
2-array:

```factor
{ 1 1 } { 3 4 } v+ .    ! => { 4 5 }
{ 2 5 } { 3 -1 } v* .   ! => { 6 -5 }
{ 1 9 } { 4 4 } vmax .  ! => { 4 9 }
{ 1 9 } { 4 4 } vmin .  ! => { 1 4 }
```

[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
[math.vectors]: https://docs.factorcode.org/content/vocab-math.vectors.html
