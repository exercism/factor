# Introduction

Factor's I/O is built on *streams* — objects you read bytes or
characters from, or write them to. The [`io`][io] vocabulary
gives you two views of the same [protocol][stream-protocol].

## The two views

**Explicit-stream** words take the stream as an argument. They
all start with `stream-`:

```
stream-read       ( n stream -- seq/f )
stream-readln     ( stream -- str/f )
stream-write      ( seq stream -- )
stream-flush      ( stream -- )
stream-contents   ( stream -- seq )
stream-lines      ( stream -- seq )
```

**Ambient-stream** words read from or write to whichever stream
is *currently bound* — the program-wide dynamic variable
`input-stream` or `output-stream`. They have short names:

```
read1 read readln write write1 print flush
```

The ambient form is what most everyday code uses. The explicit
form is what you reach for when you've got a specific stream in
hand and don't want to swap the ambient one.

## In-memory streams

For the exercise you'll work with string-backed streams from
[`io.streams.string`][io.streams.string]:

```
<string-reader>   ( str -- reader )
<string-writer>   ( -- writer )
```

A `<string-reader>` reads from a literal string as if it were a
file; a `<string-writer>` collects everything written to it so
you can read it back later. Both implement the same protocol as
file streams, so the lessons transfer directly to
`<file-reader>` / `<file-writer>`.

## Scoping with `with-…`

To bind an explicit stream as the ambient one for a quotation
and dispose it afterward, use a `with-…` combinator:

```
with-input-stream    ( stream quot -- )
with-output-stream   ( stream quot -- )
with-string-writer   ( quot -- str )
with-file-reader     ( path encoding quot -- )
with-file-writer     ( path encoding quot -- )
```

[`with-string-writer`][with-string-writer] is the convenience form for "collect what
this quotation prints" — it builds the writer, runs the
quotation with that writer as the ambient output, and returns
the captured string:

```factor
USING: io io.streams.string ;

[ "captured" print ] with-string-writer .
! => "captured\n"
```

All the `with-…` combinators are destructor combinators (the
same family as [`boatswains-bilge`][boatswains-bilge]'s
`with-disposal` and `with-destructors`) — the stream is
disposed on exit even if the quotation throws.

[io]: https://docs.factorcode.org/content/vocab-io.html
[io.streams.string]: https://docs.factorcode.org/content/vocab-io.streams.string.html
[with-string-writer]: https://docs.factorcode.org/content/word-with-string-writer,io.streams.string.html
[boatswains-bilge]: https://exercism.org/tracks/factor/exercises/boatswains-bilge
[stream-protocol]: https://docs.factorcode.org/content/article-stream-protocol.html
