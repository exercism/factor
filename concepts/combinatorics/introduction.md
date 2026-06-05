# Introduction

*Combinatorics* is the mathematics of counting and listing the ways a
collection of items can be chosen or arranged. Factor's
[`math.combinatorics`][math.combinatorics] vocabulary covers the two
basic questions:

- **Combinations** — selections where order does *not* matter.
- **Permutations** — arrangements where order *does* matter.

Each question has a *counting* word that returns a number and a
*listing* word that returns the actual selections, plus a streaming
`each-` variant that calls a quotation with each one:

```
nCk              ( n k -- m )              ! count of k-combinations
nPk              ( n k -- m )              ! count of k-permutations
all-combinations ( seq k -- combinations )
all-permutations ( seq -- permutations )
each-combination ( seq k quot -- )
each-permutation ( seq quot -- )
```

```factor
USING: math.combinatorics prettyprint ;

5 2 nCk .                        ! => 10
{ 1 2 3 } 2 all-combinations .   ! => { { 1 2 } { 1 3 } { 2 3 } }
{ 1 2 } all-permutations .       ! => { { 1 2 } { 2 1 } }
```

[math.combinatorics]: https://docs.factorcode.org/content/vocab-math.combinatorics.html
