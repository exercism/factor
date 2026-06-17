# About

A *disjoint set* (a union-find structure) keeps a collection of values
partitioned into non-overlapping groups, and answers one question
quickly: are these two values in the same group? It lives in the
[`disjoint-sets`][disjoint-sets] vocabulary.

`<disjoint-set>` builds an empty structure. Values — *atoms* — are
added with `add-atom`, or in bulk with `add-atoms`; each one starts in
a group by itself:

```
<disjoint-set> ( -- disjoint-set )
add-atom       ( atom disjoint-set -- )
add-atoms      ( seq disjoint-set -- )
```

```factor
USING: disjoint-sets ;

<disjoint-set>
{ "a" "b" "c" "d" } over add-atoms   ! four singleton groups
```

`equate` unions the groups containing two atoms. Unioning is
transitive: once `a` is equated with `b` and `b` with `c`, all three
share one group.

```
equate ( atom1 atom2 disjoint-set -- )
```

Each group is identified by a single canonical member, its
*representative*. `representative` returns it, and two atoms belong to
the same group precisely when their representatives are equal.
`equiv?` makes that test directly:

```
representative ( atom disjoint-set -- representative )
equiv?         ( atom1 atom2 disjoint-set -- ? )
```

```factor
USING: disjoint-sets ;

<disjoint-set>
{ "a" "b" "c" "d" } over add-atoms
"a" "b" pick equate
"b" "c" pick equate
"a" "c" pick equiv? .          ! => t   (transitively connected)
"a" "d" pick equiv? .          ! => f
"a" over representative
"c" pick representative = .     ! => t   (same representative)
```

Which atom is chosen as a group's representative is an internal
detail — it may be any member of the group, and it can change as
groups merge. Never depend on a particular atom being the
representative; only on two atoms in the same group agreeing.

`disjoint-set-members` returns every atom that has been added.

The structure is *mutable*: `equate` and `add-atom` change the
disjoint set in place rather than returning a new one. The
implementation uses union by rank with path compression, so a long run
of `equate` and `representative` calls is effectively constant time
each.

[disjoint-sets]: https://docs.factorcode.org/content/vocab-disjoint-sets.html
