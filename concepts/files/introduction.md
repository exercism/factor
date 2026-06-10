# Introduction

A file is a stream with a name on disk. The [`io.files`][io.files] vocabulary
reads and writes files either whole — in a single call — or incrementally
through a scoped stream. Every file word takes an **encoding**; for text that
is almost always [`utf8`][utf8] from `io.encodings.utf8`.

## Reading

```
file-contents   ( path encoding -- str )
file-lines      ( path encoding -- seq )
```

`file-contents` returns the whole file as one string. `file-lines` returns its
lines as an array, with the line breaks removed.

## Writing

```
set-file-contents   ( str path encoding -- )
set-file-lines      ( seq path encoding -- )
```

Both replace the file (creating it if needed). `set-file-lines` writes one
element per line, adding the newlines for you.

## Appending and incremental I/O

The `with-…` combinators open a file as the ambient stream for a quotation and
close it afterward — a destructor scope, like the stream combinators in
`channel-chatter`.

```
with-file-reader     ( path encoding quot -- )
with-file-writer     ( path encoding quot -- )
with-file-appender   ( path encoding quot -- )
```

```factor
USING: io io.encodings.utf8 io.files ;

"log.txt" utf8 [ "another line" print ] with-file-appender
```

[io.files]: https://docs.factorcode.org/content/vocab-io.files.html
[utf8]: https://docs.factorcode.org/content/vocab-io.encodings.utf8.html
