# Introduction

Most sequence words you've seen return *new* sequences and
leave their inputs alone — `suffix`, `reverse`, `map`, and so on.
But arrays and vectors also support **in-place mutation**, and
both come up when you want to record state that changes over
time.

## Two flavours of mutable sequence

- **Arrays** (`{ … }`) have a fixed length. `<array> ( n elt --
  array )` (in [`arrays`][arrays]) builds a fresh array of length
  `n` filled with copies of `elt`.
- **Vectors** (`V{ … }`) grow and shrink. Use `V{ } clone` for a
  fresh empty one; `<vector> ( n -- vector )` (in
  [`vectors`][vectors]) preallocates capacity for `n` elements.

```factor
USING: arrays kernel vectors ;

5 0 <array> .   ! => { 0 0 0 0 0 }
V{ } clone .    ! => V{ }
```

## Changing a slot

These two work on either kind of sequence — both expect the
sequence as the *last* input:

```
set-nth    ( elt n seq -- )
change-nth ( i   seq quot -- )
```

`set-nth` assigns; `change-nth` applies a quotation to the
element at position `i`. Both return nothing on the stack — the
mutation is the effect.

```factor
USING: arrays kernel math sequences ;

5 0 <array>                 ! { 0 0 0 0 0 }
7 2 pick set-nth            ! mutates: position 2 becomes 7
[ 1 + ] 0 pick change-nth   ! mutates: position 0 += 1
.                           ! => { 1 0 7 0 0 }
```

## Growing and shrinking

These three only make sense on vectors, since arrays can't
change length:

```
push  ( elt seq -- )    ! append to the end
pop   ( seq -- elt )    ! remove and return the last
pop*  ( seq -- )        ! remove the last, discard
```

```factor
USING: kernel sequences vectors ;

V{ } clone              ! a fresh empty vector
"alice" over push       ! V{ "alice" }
"bob"   over push       ! V{ "alice" "bob" }
dup pop .               ! prints "bob"
.                       ! prints V{ "alice" }
```

## Vector → array

When you've built up a vector and want to hand back a fixed-length
array, `>array ( seq -- array )` (in [`arrays`][arrays]) returns a
new array with the same elements:

```factor
USING: arrays kernel sequences vectors ;

V{ "alice" "bob" "carol" } >array .
! => { "alice" "bob" "carol" }
```

## `clone` — keep a snapshot

Mutation modifies the sequence in place. If a caller hands you a
sequence and you're about to change it, `clone` (in
[`kernel`][kernel]) gives you a fresh independent copy so the
caller's view doesn't shift under them:

```factor
USING: kernel ;

V{ "a" "b" "c" } clone .    ! => V{ "a" "b" "c" }   (a fresh copy)
```

[arrays]: https://docs.factorcode.org/content/vocab-arrays.html
[vectors]: https://docs.factorcode.org/content/vocab-vectors.html
[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
