# Introduction

You've already *used* streams in `channel-chatter` and disposed
of them in `boatswains-bilge`. This exercise is your first
custom stream — a class that implements the [protocol][stream-protocol] so the
same `with-input-stream` / `read1` / `stream-read1` code that
worked on a `<string-reader>` works on yours.

## Mixins: the other half of the class hierarchy

You already know `TUPLE: child < parent …` from
`dragons-descendants` — a single-parent hierarchy where slots
flow down. Factor has a *second* way to extend the class graph:
**open mixins**. A `MIXIN: m` declares a class with no slots
that other classes can join after the fact with `INSTANCE: c m`.
Membership is many-to-many: a class can be an instance of as
many mixins as it likes.

The streams protocol uses two mixins to mark which half of the
interface a class implements:

```factor
INSTANCE: my-stream input-stream    ! readable
INSTANCE: my-stream output-stream   ! writable
```

A stream can be one, the other, or both. Generic methods on
`input-stream` (or `output-stream`) then dispatch to any class
that has joined the mixin — that's how the ambient `read1`,
`stream-contents`, `with-input-stream`, etc. find their way to
your class.

Mixins are *open*: you can add a new member after the mixin is
declared, even in a different vocabulary. That's the contrast
with `TUPLE: < parent`, where the relationship is fixed when
the child class is declared.

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

Streams are disposables: a custom stream extends `disposable`
and implements `dispose*`. That's the framework from
`boatswains-bilge`, applied to a stream class:

```factor
TUPLE: my-stream < disposable underlying ;

: <my-stream> ( underlying -- s )
    my-stream new-disposable swap >>underlying ;

M: my-stream dispose* underlying>> dispose ;
```

Once that's in place, all the `with-…` combinators from
`channel-chatter` work on your stream automatically.

[io]: https://docs.factorcode.org/content/vocab-io.html
[stream-protocol]: https://docs.factorcode.org/content/article-stream-protocol.html
