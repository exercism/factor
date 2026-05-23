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

## Cleanup is from `destructors`

Streams hold OS resources, so they extend `disposable` (the `<`
parent syntax in `TUPLE:`) and implement `dispose*` — the same
framework you used in `boatswains-bilge`. A custom stream
declares:

```factor
TUPLE: my-stream < disposable underlying ;

: <my-stream> ( underlying -- s )
    my-stream new-disposable swap >>underlying ;

M: my-stream dispose* underlying>> dispose ;
```

Callers use `with-input-stream` (and friends) to acquire and
release the stream in one move — see boatswains-bilge for the
full disposal API.

[io]: https://docs.factorcode.org/content/vocab-io.html
