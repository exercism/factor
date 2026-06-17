# Introduction

A *disjoint set* (a union-find structure) keeps a collection of values
partitioned into non-overlapping groups, and answers one question
quickly: are these two values in the same group? It lives in the
[`disjoint-sets`][disjoint-sets] vocabulary.

## Building a disjoint set

`<disjoint-set>` builds an empty structure. Values — *atoms* — are
added with `add-atom` one at a time, or with `add-atoms` from a
sequence. Each atom starts in a group by itself.

```
<disjoint-set> ( -- disjoint-set )
add-atom       ( atom disjoint-set -- )
add-atoms      ( seq disjoint-set -- )
```

```factor
USING: disjoint-sets ;

<disjoint-set>
{ 1 2 3 } over add-atoms   ! 1, 2 and 3 each in their own group
```

The disjoint set is *mutable*: `add-atom`, `add-atoms`, and `equate`
change it in place rather than returning a new one. `keep` is handy
when you want the disjoint set back on the stack after one of these
words has consumed it.

## Merging groups

`equate` unions the two groups that contain its atoms. Unioning is
transitive: equate two atoms, then one of them with a third, and all
three end up in one group.

```
equate ( atom1 atom2 disjoint-set -- )
```

## Representatives

Every group has one canonical member, its *representative*.
`representative` returns it, and two atoms belong to the same group
precisely when their representatives are equal.

```
representative ( atom disjoint-set -- representative )
```

```factor
USING: disjoint-sets ;

<disjoint-set>
{ 1 2 3 } over add-atoms
1 2 pick equate
1 over representative .   ! => 1
2 over representative .   ! => 1   (same representative as 1)
3 over representative .   ! => 3   (still on its own)
```

Which atom a group picks as its representative is an internal
detail — never depend on a particular atom being chosen, only on two
atoms in the same group agreeing.

[disjoint-sets]: https://docs.factorcode.org/content/vocab-disjoint-sets.html
