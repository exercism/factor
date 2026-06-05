# Introduction

The [`math.combinatorics`][math.combinatorics] vocabulary answers two
kinds of question about a collection of items:

- **Combinations** — how many ways, or which ways, can you *choose* a
  group, ignoring order?
- **Permutations** — how many ways, or which ways, can you *arrange*
  items, where order matters?

For each question there is a *counting* word that returns a number and
a *listing* word that returns the actual selections.

## Counting

`nCk` ("n choose k") returns how many `k`-element combinations can be
chosen from `n` items:

```
nCk ( n k -- m )
```

```factor
USING: math.combinatorics prettyprint ;

5 2 nCk .    ! => 10
6 3 nCk .    ! => 20
5 5 nCk .    ! => 1
```

`nPk` returns how many `k`-element *ordered* selections (permutations)
can be made from `n` items. Because order matters, the count is at
least as large as the matching `nCk`:

```
nPk ( n k -- m )
```

```factor
5 2 nPk .    ! => 20
6 3 nPk .    ! => 120
```

## Listing combinations

`all-combinations` returns every `k`-element subset of a sequence. The
elements inside each combination keep their original order, and the
combinations come back in lexicographic order:

```
all-combinations ( seq k -- combinations )
```

```factor
{ 1 2 3 } 2 all-combinations .
! => { { 1 2 } { 1 3 } { 2 3 } }
```

When you only want to process each combination as it is produced —
rather than collect them all — use the streaming form
`each-combination`, which calls a quotation with each combination:

```
each-combination ( seq k quot -- )
```

```factor
{ 1 2 3 } 2 [ . ] each-combination
! => { 1 2 }
! => { 1 3 }
! => { 2 3 }
```

## Listing permutations

`all-permutations` returns every ordering of a sequence:

```
all-permutations ( seq -- permutations )
```

```factor
{ 1 2 } all-permutations .
! => { { 1 2 } { 2 1 } }

{ 1 2 3 } all-permutations .
! => { { 1 2 3 } { 1 3 2 } { 2 1 3 } { 2 3 1 } { 3 1 2 } { 3 2 1 } }
```

Its streaming counterpart is `each-permutation`, which calls a
quotation with each ordering:

```
each-permutation ( seq quot -- )
```

```factor
{ 1 2 } [ . ] each-permutation
! => { 1 2 }
! => { 2 1 }
```

[math.combinatorics]: https://docs.factorcode.org/content/vocab-math.combinatorics.html
