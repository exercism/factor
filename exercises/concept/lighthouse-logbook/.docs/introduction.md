# Introduction

Hash-sets are mutable, unordered collections that store each
value at most once. Lookup, insert, and delete are all O(1)
average. They live in [`hash-sets`][hash-sets] and implement the
[`sets`][sets] protocol.

## Hash-set literals

```factor
HS{ "NS-1024" "WB-203" } .
! => HS{ "NS-1024" "WB-203" }
```

`HS{ }` is the empty literal. Like other Factor literals it's a
*shared* object — every reference to `HS{ }` in source points to
the same set. `HS{ } clone` gives you a fresh independent copy
each call.

## Adjoining and removing

```
adjoin ( elt set -- )    ! insert in place; no-op if already present
delete ( elt set -- )    ! remove in place; no-op if absent
```

Both mutate the set; neither returns anything on the stack.

```factor
USING: hash-sets kernel sets ;

HS{ } clone
"NS-1024" over adjoin
"WB-203"  over adjoin
"NS-1024" over adjoin    ! duplicate — no effect
.                        ! => HS{ "NS-1024" "WB-203" }
```

## Asking the set

```
in?         ( elt set -- ? )   ! is elt in the set?
cardinality ( set -- n )       ! number of elements
members     ( set -- seq )     ! enumerate as a sequence
```

`in?` is the set-protocol membership test. It's distinct from
`member?` (from `sequences`), which does a linear scan over a
sequence. For a hash-set, `in?` is a hash lookup — O(1) average,
the whole point of using a hash-set.

```factor
"NS-1024" my-log in? .   ! => t
"X-99"    my-log in? .   ! => f
my-log cardinality .     ! => 2
```

## Combining sets

```
union     ( set1 set2 -- set )
intersect ( set1 set2 -- set )
diff      ( set1 set2 -- set )
set-like  ( set exemplar -- set' )
```

`union` is "all elements from either"; `intersect` is "elements
in both"; `diff` is "in `set1` but not `set2`". Each returns a
new set without mutating its inputs.

`set-like` coerces `set` to the type of `exemplar`. The default
implementations of `union`/`intersect`/`diff` use it to make the
result match the type of the receiver — `<my-set> <hash-set>
union` returns a `my-set`, not a hash-set.

## Why this matters

Hash-sets pair naturally with hashtables for *graph traversal*:
a hashtable maps each node to its neighbours, and a hash-set
records which nodes have already been visited so the search
doesn't loop or repeat work. The traversal is then a queue
plus the two structures, mutated in place as you sweep
outwards.

[hash-sets]: https://docs.factorcode.org/content/vocab-hash-sets.html
[sets]: https://docs.factorcode.org/content/vocab-sets.html
