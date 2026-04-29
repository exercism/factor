# About

Factor sequences come in two flavours when you need to *modify*
them:

- **Arrays** (`{ … }`) have a fixed length. You can change what's
  *at* each position with `set-nth` / `change-nth`, but you
  can't grow or shrink them.
- **Vectors** (`V{ … }`) are variable-length. `push` adds to the
  end, `pop` removes and returns the last element.

```factor
USING: arrays kernel sequences ;

! Fixed-length: build a counter array of zeros, then bump one slot.
3 0 <array>            ! { 0 0 0 }
dup [ 1 + ] 1 rot change-nth
.                      ! { 0 1 0 }

! Variable-length: build a vector of names by pushing.
V{ } clone
"alice" over push
"bob" over push
dup pop drop           ! removes "bob"
.                      ! V{ "alice" }
```

| word            | effect                                         |
|-----------------|------------------------------------------------|
| `<array>`       | `( n elt -- array )` — array of `n` copies of `elt` |
| `<vector>`      | `( n -- vector )` — empty vector with capacity `n` |
| `V{ }`          | empty vector literal                           |
| `set-nth`       | `( elt n seq -- )` — assign element at index `n` |
| `change-nth`    | `( i seq quot -- )` — apply `quot` to element at `i` |
| `push`          | `( elt seq -- )` — append to a vector          |
| `pop`           | `( seq -- elt )` — remove and return last      |
| `pop*`          | `( seq -- )` — remove last, discard            |
| `clone`         | `( obj -- copy )` — fresh independent copy     |
| `new-sequence`  | `( n exemplar -- newseq )` — fresh sequence of same class as `exemplar` |
| `new-resizable` | `( n exemplar -- newseq )` — fresh resizable variant |

When you mutate a sequence the caller passed in, the change is
visible to the caller — they're holding the same object. If
that's not what you want, `clone` first to get an independent
copy.
