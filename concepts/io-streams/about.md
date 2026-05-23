# About

Factor splits stream I/O into two layers. The lower layer is the
*explicit-stream* API: every word takes the stream as an
argument. The upper layer is the *ambient-stream* API: short,
one-line words that act on whichever stream is currently bound.
Both layers sit on the same protocol — the upper-layer words
just look up the ambient stream and forward the call.

## Explicit-stream words

```
stream-read       ( n stream -- seq/f )
stream-read1      ( stream -- elt/f )
stream-readln     ( stream -- str/f )
stream-write      ( seq stream -- )
stream-write1     ( elt stream -- )
stream-print      ( str stream -- )
stream-flush      ( stream -- )
stream-contents   ( stream -- seq )
stream-lines      ( stream -- seq )
```

`stream-contents` drains everything; `stream-lines` drains and
splits on line boundaries; `stream-readln` returns one line at
a time (or `f` at end-of-stream).

## Ambient-stream words

```
read1   ( -- elt/f )
read    ( n -- seq/f )
readln  ( -- str/f )
write   ( seq -- )
write1  ( elt -- )
print   ( str -- )
flush   ( -- )
```

These are the everyday I/O words. They look up the current
input or output stream from the dynamic variables
`input-stream` / `output-stream` and forward. That's why
redirecting `print` to a string is just a matter of binding
`output-stream` for the duration of a quotation.

## Bundled stream constructors

| word              | vocab                | what it builds                  |
|-------------------|----------------------|---------------------------------|
| `<string-reader>` | `io.streams.string`  | reads a literal string          |
| `<string-writer>` | `io.streams.string`  | collects writes into a string   |
| `<file-reader>`   | `io.files`           | reads a file with an encoding   |
| `<file-writer>`   | `io.files`           | writes a file with an encoding  |

All four produce disposables — they extend `disposable` from
`destructors`, so the `with-…` combinators below release them
on exit.

## Scoped binding

```
with-input-stream   ( stream quot -- )
with-output-stream  ( stream quot -- )
with-string-reader  ( str quot -- )
with-string-writer  ( quot -- str )
with-file-reader    ( path encoding quot -- )
with-file-writer    ( path encoding quot -- )
```

Each one opens a stream, binds it as the ambient input or
output for the inner quotation, and disposes it on exit — even
if the quotation throws. They're the destructor combinators of
`boatswains-bilge`, specialised to streams.

`with-string-writer` is a particularly clean variant: it
constructs a fresh `<string-writer>` automatically, runs the
quotation with that writer as the ambient output, and returns
the accumulated string. The whole "capture a quotation's
output" pattern is one word.

```factor
USING: io io.streams.string ;

[ "alpha" print "bravo" print ] with-string-writer .
! => "alpha\nbravo\n"
```

## Why ambient at all?

The dynamic-variable binding is the reason `print` works in a
program that doesn't know whether it's being run interactively,
into a log file, or into a captured test buffer. Replace the
binding once and every word that calls `print` does the right
thing — no rewiring required. That's the inversion the upper
layer buys you.

For *implementing* a stream — defining your own class that
plugs into the protocol — see the `streams` concept (taught in
`telegraphers-tape`).

[io]: https://docs.factorcode.org/content/vocab-io.html
[io.streams.string]: https://docs.factorcode.org/content/vocab-io.streams.string.html
[io.files]: https://docs.factorcode.org/content/vocab-io.files.html
