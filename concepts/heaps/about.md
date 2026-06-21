# About

A *heap* is a collection that always knows its smallest (or largest)
item and lets you remove it quickly — the natural implementation of a
*priority queue*. Heaps live in the [`heaps`][heaps] vocabulary.

`<min-heap>` builds an empty heap whose smallest key comes out first;
`<max-heap>` serves the largest first. Each item is a *value* stored
under a *key*, and the key is the priority Factor orders on:

```
<min-heap> ( -- min-heap )
<max-heap> ( -- max-heap )
heap-push  ( value key heap -- )
heap-push-all ( assoc heap -- )
```

```factor
USING: heaps ;

<min-heap>
"alice" 5 pick heap-push
"bob"   2 pick heap-push
```

A heap is *mutable*: `heap-push` and `heap-pop` change it in place.

```
heap-peek    ( heap -- value key )
heap-pop     ( heap -- value key )
heap-pop-all ( heap -- alist )
heap-empty?  ( heap -- ? )
heap-size    ( heap -- n )
```

`heap-peek` reads the front without removing it; `heap-pop` removes and
returns it; `heap-pop-all` drains the heap into an association list of
`{ key value }` pairs in priority order.

```factor
USING: assocs heaps kernel prettyprint ;

<min-heap>
"alice" 5 pick heap-push
"bob"   2 pick heap-push
"carol" 9 pick heap-push
dup heap-pop .           ! => 2 "bob"   (removed; value then key)
heap-pop-all values .    ! => { "alice" "carol" }
```

Pushing is `O(log n)` and reading the front is `O(1)`, so repeatedly
"take the most urgent item, then add more" stays fast even for a large
queue. The implementation is a binary heap stored in a growable array;
the key may be any orderable value (numbers, strings, …).

[heaps]: https://docs.factorcode.org/content/vocab-heaps.html
