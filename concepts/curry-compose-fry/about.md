# About

Closures — quotations that remember values from their environment —
are how Factor builds reusable transformations. `curry` and
`compose` cover the simple cases; fry quotations cover the rest.

```factor
3 [ + ] curry .      ! [ 3 + ]
[ 1 + ] [ 2 * ] compose .   ! [ 1 + 2 * ]
2 3 '[ _ _ + + ] .   ! [ 2 3 + + ]
```

| tool      | shape                                | when to reach for it           |
|-----------|--------------------------------------|--------------------------------|
| `curry`   | `value quot -- newquot`              | one captured value             |
| `2curry`  | `v1 v2 quot -- newquot`              | two values, both at the front  |
| `compose` | `quot1 quot2 -- combined`            | join two quotations end-to-end |
| `'[ _ ]`  | `… -- newquot`                       | many captures, anywhere inside |

Fry is a compile-time rewrite: `'[ _ + ]` expands to a `curry` call
on `[ + ]`. The compiler handles the bookkeeping; you just write
the underscores where the captured values should appear.
