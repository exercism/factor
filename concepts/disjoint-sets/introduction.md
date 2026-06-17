# Introduction

A *disjoint set* (also called a union-find structure) keeps a
collection of values partitioned into non-overlapping groups. It lives
in the [`disjoint-sets`][disjoint-sets] vocabulary.

`<disjoint-set>` builds an empty structure. `add-atom` adds one value
as a group of its own, and `add-atoms` adds every value in a sequence:

```
<disjoint-set> ( -- disjoint-set )
add-atom       ( atom disjoint-set -- )
add-atoms      ( seq disjoint-set -- )
```

```factor
USING: disjoint-sets ;

<disjoint-set>            ! a new, empty disjoint set
{ 1 2 3 } over add-atoms  ! 1, 2 and 3 each start in their own group
```

`equate` merges the two groups that contain its atoms — afterwards
they are one group:

```
equate ( atom1 atom2 disjoint-set -- )
```

Every group has a single canonical member, its *representative*.
`representative` returns it; two atoms are in the same group exactly
when they share a representative. `equiv?` checks that directly:

```
representative ( atom disjoint-set -- representative )
equiv?         ( atom1 atom2 disjoint-set -- ? )
```

```factor
USING: disjoint-sets ;

<disjoint-set>
{ 1 2 3 } over add-atoms
1 2 pick equate          ! merge the groups of 1 and 2
1 over representative .   ! => 1
2 over representative .   ! => 1  (same representative as 1)
1 2 pick equiv? .         ! => t
1 3 pick equiv? .         ! => f
```

`disjoint-set-members` returns every atom that has been added.

[disjoint-sets]: https://docs.factorcode.org/content/vocab-disjoint-sets.html
