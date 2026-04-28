# Introduction

Most Factor sequence words return *new* sequences and leave their
inputs alone, but arrays and vectors both also support **in-place
mutation** when you want to record state that evolves over time.

`set-nth` and `change-nth` change a slot in place — and work on
either an array or a vector. `<array>` builds a fixed-length
mutable array; `V{ }` literals, `<vector>`, `push`, and `pop`
are the vector-only set, since arrays can't change length.
`clone` duplicates the sequence so further mutations don't
bleed into the original.

```factor
USING: arrays kernel sequences ;

5 0 <array>                 ! a fresh array { 0 0 0 0 0 }
dup 7 2 swap set-nth        ! { 0 0 7 0 0 } — set position 2 to 7
.

V{ } clone                  ! a fresh, empty vector
"alice" over push           ! V{ "alice" }
"bob" over push             ! V{ "alice" "bob" }
dup pop .                   ! "bob"
.                           ! V{ "alice" }
```

[arrays]: https://docs.factorcode.org/content/vocab-arrays.html
[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
