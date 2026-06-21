# Introduction

A *heap* is a collection that always knows its smallest item and lets
you take that item out quickly. It's the natural tool for a *priority
queue* — a waiting line where the most important item is served next,
not the one that has waited longest. Heaps live in the [`heaps`][heaps]
vocabulary.

## Building a heap

`<min-heap>` builds an empty heap whose *smallest* key comes out first;
`<max-heap>` is the mirror image.

```
<min-heap> ( -- min-heap )
<max-heap> ( -- max-heap )
```

## Adding items

Each item is stored as a *value* together with a *key* — the key is the
priority Factor orders on. `heap-push` adds one:

```
heap-push ( value key heap -- )
```

```factor
USING: heaps ;

<min-heap>
"alice" 5 pick heap-push   ! value "alice", priority 5
"bob"   2 pick heap-push   ! value "bob",   priority 2
```

A heap is *mutable*: `heap-push` changes it in place rather than
returning a new one. `keep` is handy for getting the heap back on the
stack after `heap-push` has consumed it.

## Looking at and removing the front

`heap-peek` returns the front item — the value with the smallest key —
*without* removing it. `heap-pop` returns that item *and* removes it.
`heap-empty?` reports whether anything is left, so you know when to
stop popping. `heap-pop-all` removes everything at once, returning an
association list of `{ key value }` pairs in priority order.

```
heap-peek    ( heap -- value key )
heap-pop     ( heap -- value key )
heap-empty?  ( heap -- ? )
heap-pop-all ( heap -- alist )
```

```factor
USING: assocs heaps kernel prettyprint ;

<min-heap>
"alice" 5 pick heap-push
"bob"   2 pick heap-push
dup heap-empty? .        ! => f      (two items waiting)
dup heap-peek drop .     ! => "bob"  (smallest key, still in the heap)
dup heap-pop drop .      ! => "bob"  (smallest key, now removed)
heap-pop-all .           ! => { { 5 "alice" } }
```

`heap-pop` and `heap-empty?` are the building blocks for serving items
one at a time — peek or pop the front, act on it, and stop once
`heap-empty?` returns `t`. The tasks below use `heap-pop-all` to drain
the whole queue in one step, but the same order falls out of popping
until the heap is empty.

The pairs from `heap-pop-all` are an *association list*: `values` (in
`assocs`) keeps just the values, dropping the keys.

[heaps]: https://docs.factorcode.org/content/vocab-heaps.html
