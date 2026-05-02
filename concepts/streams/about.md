# About

Factor's I/O is built on a single protocol that any data source
or sink can implement. The bundled streams — `<file-reader>`,
`<file-writer>`, `<string-reader>`, `<string-writer>`,
network sockets, byte arrays, ttys — are all classes that
implement the same handful of generics from [`io`][io] and
extend `disposable` from [`destructors`][destructors].

```factor
USING: io ;

GENERIC: stream-read1        ( stream -- elt/f )
GENERIC: stream-read-unsafe  ( n buf stream -- count )
GENERIC: stream-write1       ( elt stream -- )
GENERIC: stream-write        ( seq stream -- )
GENERIC: stream-flush        ( stream -- )
GENERIC: stream-element-type ( stream -- type )
```

`stream-read-unsafe` is the low-level batch read: fill a
caller-provided buffer and return how many elements were
written. The public `stream-read` and `stream-read-partial` are
built on it and handle allocation. Most user-defined streams
implement either `stream-read1` (when reads happen one element
at a time) or `stream-read-unsafe` (when reads can be batched).

## Joining the mixins

```factor
INSTANCE: my-stream input-stream
INSTANCE: my-stream output-stream
```

A class can be one, the other, or both. Joining the mixin makes
default methods on `input-stream` / `output-stream` dispatch to
your class — the same open-mixin pattern as `set` from the
`sets` vocab.

## The disposable framework

`new-disposable ( class -- disposable )` registers a fresh
instance with the current destructor scope so that an exception
in the middle of resource setup unwinds cleanly:

```factor
USING: destructors ;

[
    "log.txt" utf8 <file-writer>   ! registered automatically
    "log.txt" utf8 <file-reader>   ! and so is this one
    ! ... use them ...
] with-destructors
! both files closed even if an error is thrown above
```

`dispose` is the public word; `dispose*` is the generic the
class implements. A subclass override of `dispose*` should clean
up its own state and then dispose any resources it owns:

```factor
M: my-stream dispose* underlying>> dispose ;
```

The framework guarantees `dispose*` runs at most once per
object — repeated `dispose` calls are no-ops.

## Scoped accessors

Three combinators set up the global "current input/output
stream" used by `print`, `read1`, etc.:

```
with-input-stream   ( stream quot -- )    ! reads in quot use stream
with-output-stream  ( stream quot -- )    ! writes in quot use stream
with-disposal       ( disposable quot -- )! generic — any disposable
```

Each disposes the resource on exit, even if the quotation
throws. They're how most code uses a custom stream rather than
threading it through every call.

[io]: https://docs.factorcode.org/content/vocab-io.html
[destructors]: https://docs.factorcode.org/content/vocab-destructors.html
