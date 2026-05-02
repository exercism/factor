# Introduction

A *stream* in Factor is anything you can read bytes from or write
bytes to. Files, sockets, in-memory buffers, and your own custom
wrappers all participate in the same small protocol from
[`io`][io].

The protocol's two halves are mixins: `input-stream` for things
you read from, `output-stream` for things you write to. A class
joins one (or both) with `INSTANCE: <class> input-stream`.

## Reading and writing

```
stream-read1         ( stream -- elt/f )
stream-read          ( n stream -- seq/f )
stream-write1        ( elt stream -- )
stream-write         ( seq stream -- )
stream-flush         ( stream -- )
stream-element-type  ( stream -- type )
```

`stream-read1` returns the next byte (or `f` at end-of-stream);
`stream-read` reads up to `n` bytes. `stream-write1` and
`stream-write` mirror those for output. `stream-flush` pushes
buffered output. `stream-element-type` reports whether the
stream deals in raw bytes (`+byte+`) or characters (`+character+`).

## Cleanup with `disposable`

Streams hold OS resources, so the protocol pairs with the
[`destructors`][destructors] vocabulary. A custom stream extends
the `disposable` parent class:

```factor
TUPLE: my-stream < disposable underlying ;
INSTANCE: my-stream output-stream

: <my-stream> ( underlying -- s )
    my-stream new-disposable swap >>underlying ;

M: my-stream dispose* underlying>> dispose ;
```

`new-disposable` (in `destructors`) is the factory: it allocates
the tuple and registers it with the destructor framework so
exceptions can't leak the resource. `M: <class> dispose*` says
*how* to clean up; user code calls `dispose` (the public word),
which marks the object disposed and then runs `dispose*`.

## Scoped use

`with-disposal`, `with-input-stream`, and `with-output-stream`
run a quotation with the resource open and dispose it on exit:

```factor
USING: io io.streams.string ;

"hello" <string-reader> [ stream-contents ] with-input-stream
! => "hello"   (the reader is disposed before this line returns)
```

[io]: https://docs.factorcode.org/content/vocab-io.html
[destructors]: https://docs.factorcode.org/content/vocab-destructors.html
