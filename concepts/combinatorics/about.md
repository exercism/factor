# About

*Combinatorics* is the mathematics of counting and listing the ways a
collection of items can be chosen or arranged. Factor's
[`math.combinatorics`][math.combinatorics] vocabulary answers two kinds
of question:

- **Combinations** — how many ways, or which ways, can you *choose* a
  group, ignoring order?
- **Permutations** — how many ways, or which ways, can you *arrange*
  items, where order matters?

For each question there is a *counting* word that returns a number and
a *listing* word that returns the actual selections.

## Counting

`nCk` ("n choose k") counts the `k`-element combinations of `n` items;
`nPk` counts the `k`-element *ordered* selections. Because order
matters, `nPk` is at least as large as the matching `nCk`:

```
nCk ( n k -- m )
nPk ( n k -- m )
```

```factor
USING: math.combinatorics prettyprint ;

5 2 nCk .    ! => 10
5 2 nPk .    ! => 20
```

## Listing

`all-combinations` returns every `k`-element subset of a sequence; the
elements inside each combination keep their original order, and the
combinations come back in lexicographic order. `all-permutations`
returns every ordering of a sequence:

```
all-combinations ( seq k -- combinations )
all-permutations ( seq -- permutations )
```

```factor
USING: math.combinatorics prettyprint ;

{ 1 2 3 } 2 all-combinations .
! => { { 1 2 } { 1 3 } { 2 3 } }

{ 1 2 3 } all-permutations .
! => { { 1 2 3 } { 1 3 2 } { 2 1 3 } { 2 3 1 } { 3 1 2 } { 3 2 1 } }
```

## Streaming

When you only want to process each selection as it is produced — rather
than collect them all — reach for the `each-` variants, which call a
quotation with each combination or permutation:

```
each-combination ( seq k quot -- )
each-permutation ( seq quot -- )
```

```factor
USING: math.combinatorics prettyprint ;

{ 1 2 3 } 2 [ . ] each-combination
! => { 1 2 }
! => { 1 3 }
! => { 2 3 }
```

A common pattern is to pair a listing word with `filter` to keep only
the selections that meet a condition — for example, the combinations
whose elements sum to a target value.

[math.combinatorics]: https://docs.factorcode.org/content/vocab-math.combinatorics.html
