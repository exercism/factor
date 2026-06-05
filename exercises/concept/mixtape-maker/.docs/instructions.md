# Instructions

Ozan is putting together the perfect mixtape: first deciding *which*
songs make the cut, then settling on the *order* they play in. You'll
build the combinatorics helpers behind his choices in the
`mixtape-maker` vocabulary.

## 1. Count combinations

Define `count-combinations` to return how many ways `k` items can be
chosen from `n`, ignoring order.

```factor
5 2 count-combinations .
! => 10
```

## 2. Count permutations

Define `count-permutations` to return how many ways `k` items can be
chosen from `n` when order matters.

```factor
5 2 count-permutations .
! => 20
```

## 3. List combinations

Define `list-combinations` to return every `k`-element combination of a
sequence.

```factor
{ 1 2 3 } 2 list-combinations .
! => { { 1 2 } { 1 3 } { 2 3 } }
```

## 4. List permutations

Define `list-permutations` to return every ordering of a sequence.

```factor
{ 1 2 } list-permutations .
! => { { 1 2 } { 2 1 } }
```

## 5. Combinations summing to a target

Define `combinations-summing-to` to return only the `k`-combinations of
a sequence whose elements add up to `target`.

```factor
{ 1 2 3 4 } 2 5 combinations-summing-to .
! => { { 1 4 } { 2 3 } }
```
