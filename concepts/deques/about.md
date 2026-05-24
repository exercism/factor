# About

`<dlist>` (in [`dlists`][dlists]) constructs a fresh doubly-linked
list. The operations live in [`deques`][deques] and dispatch on
the deque protocol, so other containers — chiefly `<dlist>` —
can implement them.

| word            | effect                              |
|-----------------|-------------------------------------|
| `<dlist>`       | `( -- dlist )` — fresh empty deque  |
| `push-front`    | `( elt deque -- )` — add to the front |
| `push-back`     | `( elt deque -- )` — add to the back  |
| `pop-front`     | `( deque -- elt )` — remove from the front |
| `pop-back`      | `( deque -- elt )` — remove from the back  |
| `peek-front`    | `( deque -- elt )` — read the front without removing |
| `peek-back`     | `( deque -- elt )` — read the back without removing  |
| `deque-empty?`  | `( deque -- ? )` — also written `empty?` (sequence protocol) |

All push/pop operations mutate the deque in place — passing a
deque to a routine and then reading from it again is the normal
pattern.

## Stack vs queue

Two conventional dispatch patterns:

```
LIFO (stack): push-back + pop-back   (or push-front + pop-front)
FIFO (queue): push-back + pop-front  (or push-front + pop-back)
```

A vector with `push` and `pop` (from `mutation`) is the right
choice when LIFO order is all you need — `<dlist>` carries
linked-list overhead. Reach for `<dlist>` when you need O(1) at
*both* ends, almost always for a FIFO queue.

## BFS pattern

A breadth-first search is the canonical FIFO use:

```factor
:: reachable ( start graph -- visited )
    HS{ } clone :> visited
    <dlist>    :> frontier
    start visited adjoin
    start frontier push-back
    [ frontier deque-empty? not ] [
        frontier pop-front graph at [
            dup visited in? [ drop ] [
                [ visited adjoin ] [ frontier push-back ] bi
            ] if
        ] each
    ] while
    visited ;
```

The deque carries the search frontier; the hash-set carries the
deduplication. Swap `pop-front` for `pop-back` and the same
shape becomes depth-first.

## `MEMO:` — automatic caching

Sometimes the per-node lookup the BFS calls is expensive. Factor
provides [`MEMO:`][memo-decl], a replacement for `:` that
auto-caches the word's result keyed on its inputs:

```factor
USING: memoize ;

MEMO: expensive-neighbours ( node -- nodes )
    ! ... slow computation ...
    ;
```

A `MEMO:` word runs its body the first time each input is seen
and returns the cached result thereafter. The cache lives for
the lifetime of the image; there is no time-based or size-based
eviction. Use it for pure functions whose inputs come from a
finite, manageable set.

[deques]: https://docs.factorcode.org/content/vocab-deques.html
[dlists]: https://docs.factorcode.org/content/vocab-dlists.html
[memoize]: https://docs.factorcode.org/content/vocab-memoize.html
[memo-decl]: https://docs.factorcode.org/content/word-MEMO__colon__%2Csyntax.html
