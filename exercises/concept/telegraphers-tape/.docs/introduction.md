# Introduction

A *stream* is anything you can read bytes from or write bytes to.
Factor's [`io`][io] vocabulary defines a small protocol — a few
generic words — and any class can join in. The bundled streams
(`<string-reader>`, `<file-writer>`, sockets, …) all implement
it; this exercise is your first custom one.

## The two mixins

Two open mixins decide which half of the protocol a class
participates in:

```factor
INSTANCE: my-stream input-stream    ! readable
INSTANCE: my-stream output-stream   ! writable
```

A stream can be one, the other, or both.

## The protocol generics

The protocol generics live in `io`:

```
stream-read1         ( stream -- elt/f )
stream-read          ( n stream -- seq/f )
stream-read-unsafe   ( n buf stream -- count )
stream-write1        ( elt stream -- )
stream-write         ( seq stream -- )
stream-flush         ( stream -- )
stream-element-type  ( stream -- type )
```

`stream-read1` returns the next byte (or `f` at end-of-stream);
`stream-write1` writes one. `stream-read-unsafe` is the
lower-level batch read most input streams provide;
`stream-read` is built on top of it and handles allocation.
`stream-element-type` says whether the stream deals in bytes
(`+byte+`) or characters (`+character+`); when you wrap another
stream, the simplest implementation just delegates to the
underlying one.

## Cleanup with `disposable`

Streams hold OS resources, so the protocol pairs with
[`destructors`][destructors]. A custom stream extends
`disposable` (the `<` parent syntax in `TUPLE:`):

```factor
TUPLE: my-stream < disposable underlying ;
```

The factory is `new-disposable` — it allocates the tuple *and*
registers it so exceptions during setup can't leak the
resource. The cleanup hook is the generic `dispose*`:

```factor
: <my-stream> ( underlying -- s )
    my-stream new-disposable swap >>underlying ;

M: my-stream dispose* underlying>> dispose ;
```

User code calls the public `dispose` (or one of the scoped
combinators below); the framework runs your `dispose*` once and
marks the object disposed. Calling `dispose` twice is harmless.

## Scoped use

Most code doesn't call `dispose` by hand — it uses a combinator
that opens the stream, runs a quotation, and disposes on exit
even if the quotation throws:

```
with-input-stream   ( stream quot -- )
with-output-stream  ( stream quot -- )
with-disposal       ( disposable quot -- )
```

[io]: https://docs.factorcode.org/content/vocab-io.html
[destructors]: https://docs.factorcode.org/content/vocab-destructors.html
