# Instructions append

## Words

Define a `custom-set` tuple, declare it an instance of the `set`
mixin, and provide methods on Factor's set protocol.

- `<custom-set> ( -- set )` — construct an empty set.
- `>custom-set ( seq -- set )` — build a set from a sequence,
  silently dropping duplicates.

Provide `M:` methods (from `sets`) on `members`, `in?`, `adjoin`,
and `set-like` for `custom-set`. With those four methods in place,
`null?`, `union`, `intersect`, `diff`, `subset?`, `set=`, and
`intersects?` from the `sets` vocabulary all work on your set
through the protocol's default implementations — the tests call
those words directly.

`adjoin ( elt set -- )` is mutating: it adds `elt` to `set` in
place if not already present.
