# Introduction

Arrays are Factor's fixed-length, immutable sequence type. You
already know how to write a literal array — `{ … }` — and how to
slice and aggregate one. This exercise covers the small toolkit
that comes up when you build arrays from values on the stack and
then look up or rearrange their contents.

## Building from the stack

`1array`, `2array`, and `3array` (in [`arrays`][arrays]) take
1, 2, or 3 values off the top of the stack and bundle them:

```
1array ( a     -- { a }     )
2array ( a b   -- { a b }   )
3array ( a b c -- { a b c } )
```

```factor
42 1array .              ! => { 42 }
3 4 2array .             ! => { 3 4 }
"x" "y" "z" 3array .     ! => { "x" "y" "z" }
```

## Joining

`concat` (in [`sequences`][sequences]) takes a sequence whose
elements are themselves sequences and flattens them by one level.
`join` does the same with a separator inserted between each pair:

```
concat ( seqs     -- seq )
join   ( seqs sep -- seq )
```

```factor
{ { 1 2 } { 3 4 } { 5 } } concat .
! => { 1 2 3 4 5 }

{ "alpha" "beta" "gamma" } ", " join .
! => "alpha, beta, gamma"
```

## Reversing

`reverse` returns a new sequence with the elements in opposite
order:

```
reverse ( seq -- newseq )
```

```factor
{ 1 2 3 4 } reverse .   ! => { 4 3 2 1 }
```

## Looking up

`index` returns the position of the first element equal to the
input value, or `f` if it isn't present. `member?` returns just a
boolean. Both take the **element first** and the **sequence
second**. `members` (in [`sets`][sets]) returns the *unique*
elements of a sequence — the deduplication operation —
and `all-unique?` (also in `sets`) tests whether the sequence
already has no duplicates:

```
index       ( elt seq -- i/f )
member?     ( elt seq -- ? )
members     ( seq     -- uniques )
all-unique? ( seq     -- ? )
```

```factor
"b" { "a" "b" "c" } index .       ! => 1
"z" { "a" "b" "c" } index .       ! => f
"b" { "a" "b" "c" } member? .     ! => t
"z" { "a" "b" "c" } member? .     ! => f
{ 1 2 3 2 1 } members .           ! => { 1 2 3 }
{ 1 2 3 } all-unique? .           ! => t
{ 1 2 1 } all-unique? .           ! => f
```

[arrays]: https://docs.factorcode.org/content/vocab-arrays.html
[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
[sets]: https://docs.factorcode.org/content/vocab-sets.html
