# Introduction

A *deque* (double-ended queue) supports `push` and `pop` at both
ends in O(1). Factor's standard implementation is `<dlist>` (a
doubly-linked list) in [`dlists`][dlists]; the operations live
in [`deques`][deques].

```factor
USING: deques dlists ;

<dlist>
1 over push-back        ! [ 1 ]
2 over push-back        ! [ 1 2 ]
3 over push-front       ! [ 3 1 2 ]
dup pop-front .         ! => 3
pop-back .              ! => 2
```

Two conventional uses:

- **Stack** — push and pop at the same end (LIFO). A vector
  with `push`/`pop` is the more usual choice for this.
- **Queue** — push at one end, pop at the other (FIFO).
  Vectors can't do this in O(1); deques can.

The FIFO use is what makes deques the right frontier for
*breadth-first search*: the search frontier grows at the back
and shrinks at the front, so older candidates are visited first
— layer by layer outward from the start.

[deques]: https://docs.factorcode.org/content/vocab-deques.html
[dlists]: https://docs.factorcode.org/content/vocab-dlists.html
