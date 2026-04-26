# About

Most iteration in Factor is expressed with combinators (`each`,
`map`, `reduce`), but explicit recursion still has its place — when
the recursion isn't list-shaped, when the base case is non-trivial,
or when you're implementing a combinator yourself.

```factor
: total ( seq -- sum )
    [ 0 ] [ unclip swap total + ] if-empty ;

: gcd ( a b -- g )
    dup zero? [ drop ] [ tuck mod gcd ] if ;
```

A few things to know:

- Plain `:` definitions can recurse with no special syntax. The
  compiler infers stack effects across the recursive call.
- `inline` words that recurse need the additional `recursive`
  modifier so the compiler knows the recursion is intentional.
- `loop ( quot -- )` lets you iterate a quotation that returns a
  boolean — keep going while it's truthy.
- Tail calls compile to jumps, so deeply recursive words don't
  blow the stack.

The `unclip` / `if-empty` pair is the standard sequence recursion
shape; `cond` is the standard multi-case dispatch shape.
