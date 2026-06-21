# Introduction

A *heap* is a collection that always knows its smallest item and lets
you remove it quickly — the natural implementation of a *priority
queue*. Heaps live in the [`heaps`][heaps] vocabulary.

`<min-heap>` builds an empty heap whose smallest key comes out first;
`<max-heap>` is the mirror image. Each item is a *value* stored under a
*key*, and the key is the priority:

```
<min-heap> ( -- min-heap )
heap-push  ( value key heap -- )
```

```factor
USING: heaps ;

<min-heap>
"alice" 5 pick heap-push
"bob"   2 pick heap-push
```

A heap is *mutable* — `heap-push` changes it in place. `heap-peek`
returns the front value and key without removing it, `heap-pop` removes
and returns it, and `heap-pop-all` drains the heap into an association
list of `{ key value }` pairs in priority order:

```
heap-peek    ( heap -- value key )
heap-pop     ( heap -- value key )
heap-pop-all ( heap -- alist )
```

```factor
USING: heaps kernel prettyprint ;

<min-heap>
"alice" 5 pick heap-push
"bob"   2 pick heap-push
dup heap-peek drop .     ! => "bob"
heap-pop-all .           ! => { { 2 "bob" } { 5 "alice" } }
```

[heaps]: https://docs.factorcode.org/content/vocab-heaps.html
