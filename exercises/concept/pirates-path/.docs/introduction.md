# Introduction

A *deque* (double-ended queue) supports push and pop at both
ends in O(1). Factor's standard implementation is `<dlist>` (a
doubly-linked list) in [`dlists`][dlists]; the operations live
in [`deques`][deques].

## The deque API

```
<dlist>       ( -- dlist )
push-front    ( elt deque -- )
push-back     ( elt deque -- )
pop-front     ( deque -- elt )
pop-back      ( deque -- elt )
deque-empty?  ( deque -- ? )
clear-deque   ( deque -- )
```

`clear-deque` empties the deque in place — useful for reuse
without reallocating.

Push and pop at the same end gives you a LIFO stack. Push at one
end and pop at the other gives you a FIFO queue:

```factor
USING: deques dlists ;

<dlist>
"alpha" over push-back
"bravo" over push-back
"charlie" over push-back
dup pop-front .   ! => "alpha"   (FIFO — oldest first)
dup pop-front .   ! => "bravo"
pop-front .       ! => "charlie"
```

For LIFO you'd reach for a vector (`V{ }`) with `push`/`pop`,
which has less per-operation overhead. Reach for `<dlist>` when
you need O(1) at *both* ends — almost always for a FIFO queue.

## Breadth-first search

The FIFO use is what makes deques the right frontier for *BFS*.
You start with a single node, push neighbours to the back, pop
candidates from the front, and dedup with a hash-set:

```factor
! DOCTEST: SKIP
USING: deques dlists hash-sets sets ;

! ... visited adjoin and frontier push-back ...
[ frontier deque-empty? ] [
    frontier pop-front ! ... look up neighbours, push unseen ones ...
] until
```

Older candidates are visited before newer ones — so the search
sweeps outward in layers from the start. That's what gives BFS
its shortest-path property: the first time you reach a goal node
is via a minimum-hop path.

## `MEMO:` — automatic caching

Sometimes the per-node lookup BFS calls is expensive. Factor's
[`memoize`][memoize] vocab gives you `MEMO:`, a drop-in
replacement for `:` that caches the word's result keyed on its
inputs:

```factor
USING: memoize ;

MEMO: gold-count ( cove -- n )
    ! ... slow lookup ...
    ;
```

A `MEMO:` word runs its body the first time each input is seen
and returns the cached result thereafter — same interface, no
extra calls at the call site, just faster on repeats.

[deques]: https://docs.factorcode.org/content/vocab-deques.html
[dlists]: https://docs.factorcode.org/content/vocab-dlists.html
[memoize]: https://docs.factorcode.org/content/vocab-memoize.html
