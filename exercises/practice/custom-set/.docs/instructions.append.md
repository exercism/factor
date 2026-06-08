# Instructions append

## Words

Define a `custom-set` tuple and declare it an instance of the `set`
mixin with `INSTANCE: custom-set set`.

- `<custom-set> ( -- set )` — construct an empty set.
- `>custom-set ( seq -- set )` — build a set from a sequence,
  silently dropping duplicates.

Then provide `M:` methods (from `sets`) on `members`, `in?`,
`adjoin`, and `set-like` for `custom-set`. With the `INSTANCE:`
declaration and those four methods in place, `null?`, `union`,
`intersect`, `diff`, `subset?`, `set=`, and `intersects?` from the
`sets` vocabulary all work on your set through the protocol's
default implementations — the tests call those words directly.

`adjoin ( elt set -- )` is mutating: it adds `elt` to `set` in
place if not already present.
