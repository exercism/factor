# About

`assocs` is a protocol, not a single data type. Hashtables (`H{ }`),
association lists (sequences of `{ key value }` pairs), and tree
maps all implement it, and most words on assocs are interchangeable
between them.

```factor
USING: assocs ;

H{ } clone "coal" over inc-at
"coal" over inc-at
"wood" over inc-at      ! => H{ { "coal" 2 } { "wood" 1 } }
```

The full surface is broad — sorted iteration, mapping, filtering —
but most exercise-level work involves a small set:

| word        | effect                                        |
|-------------|-----------------------------------------------|
| `at`        | `( key assoc -- value/f )`                    |
| `at*`       | `( key assoc -- value ? )` distinguishes f-as-value from missing |
| `key?`      | `( key assoc -- ? )`                          |
| `set-at`    | `( value key assoc -- )` — mutates            |
| `change-at` | `( key assoc quot -- )` — `quot` is `( old -- new )` |
| `inc-at`    | `( key assoc -- )` — `+1`, inserting `1` if absent |
| `delete-at` | `( key assoc -- )` — mutates                  |
| `>alist`    | `( assoc -- pairs )`                          |

`sort-keys` and `sort-values` (in `sorting`) sort an alist by the
chosen field.
