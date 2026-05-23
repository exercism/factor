# About

Resources that hold OS state (file handles, sockets, locks)
need *guaranteed* cleanup — even when an exception unwinds the
stack. Factor's [`destructors`][destructors] vocab provides a
small framework for that, and most built-in resources
(`<file-reader>`, `<file-writer>`, sockets, …) already plug into
it.

## The class and the generic

A class joins by extending `disposable` and implementing
`dispose*`:

```factor
TUPLE: my-handle < disposable underlying ;

: <my-handle> ( underlying -- handle )
    my-handle new-disposable swap >>underlying ;

M: my-handle dispose* underlying>> dispose ;
```

`new-disposable ( class -- obj )` allocates the tuple *and*
registers it with the current destructor scope, so an exception
between allocation and the next safe point can't leak the
resource. The framework guarantees `dispose*` runs **at most
once** per object — repeated `dispose` calls are no-ops.

## Public callers use `dispose`

| word              | effect                                        |
|-------------------|-----------------------------------------------|
| `dispose`         | `( obj -- )` — release; safe to call twice    |
| `with-disposal`   | `( disposable quot -- )` — scope one resource |
| `with-destructors`| `( quot -- )` — open a registry scope         |
| `&dispose`        | `( obj -- obj )` — dispose on normal *or* failure exit |
| `|dispose`        | `( obj -- obj )` — dispose only if the scope unwinds |

`with-disposal` is the single-resource form. For more than one
resource, open a `with-destructors` scope and register each
acquisition with `&dispose` (you always want to release it) or
`|dispose` (release only on failure — the success path keeps
it).

```factor
[
    "in.txt"  utf8 <file-reader> &dispose
    "out.txt" utf8 <file-writer> &dispose
    [ read1 ] [ write1 ] bi
] with-destructors
```

## `cleanup` is the bare primitive

For a one-off try/finally without a registry, [`cleanup`][cleanup]
(from `continuations`) is the lower-level word:

```
cleanup ( try cleanup-always cleanup-error -- )
```

`with-destructors` is strictly more powerful (the registry can
grow at runtime), but `cleanup` is the natural fit when the
pairing of acquire/release is fixed and local.

[destructors]: https://docs.factorcode.org/content/vocab-destructors.html
[cleanup]: https://docs.factorcode.org/content/word-cleanup%2Ccontinuations.html
