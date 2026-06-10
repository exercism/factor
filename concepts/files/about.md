# About

A file is a stream with a name on disk. The [`io.files`][io.files] vocabulary
offers two ways to work with one: whole-file convenience words that read or
write everything in a single call, and stream openers (the `with-…`
combinators) for reading or writing incrementally. Both rest on the same
[stream protocol][stream-protocol] as the in-memory streams from the
`io-streams` concept — a `<file-reader>` and a `<string-reader>` answer the same
words.

Every file word takes an **encoding**, the scheme that maps bytes to characters
and back. For text this is almost always [`utf8`][utf8] from
`io.encodings.utf8`; binary work uses `latin1` or a `<byte-array>` encoding.

## Whole-file reading

```
file-contents   ( path encoding -- str )
file-lines      ( path encoding -- seq )
```

`file-contents` returns the entire file as one string. `file-lines` returns its
lines as an array, with the line terminators stripped off — handy when each
line is a record.

```factor
USING: io.encodings.utf8 io.files ;

"forecast.txt" utf8 file-contents   ! => "sunny\ncloudy\n"
"forecast.txt" utf8 file-lines      ! => { "sunny" "cloudy" }
```

## Whole-file writing

```
set-file-contents   ( str path encoding -- )
set-file-lines      ( seq path encoding -- )
```

Both **replace** the file, creating it if it does not exist.
`set-file-contents` writes a string verbatim; `set-file-lines` writes each
element of a sequence on its own line, supplying the newlines.

```factor
{ "sunny" "cloudy" } "forecast.txt" utf8 set-file-lines
! forecast.txt now holds "sunny\ncloudy\n"
```

## Scoped streams

When you want to add to a file, or read and write piece by piece, open it with a
`with-…` combinator and use the ambient stream words inside the quotation:

```
with-file-reader     ( path encoding quot -- )
with-file-writer     ( path encoding quot -- )
with-file-appender   ( path encoding quot -- )
```

```factor
USING: io io.encodings.utf8 io.files ;

"log.txt" utf8 [ "another line" print ] with-file-appender
```

`with-file-writer` truncates the file first; `with-file-appender` keeps the
existing contents and writes after them. Each one is a destructor scope: the
file handle is closed when the quotation finishes, even if it throws — the same
guarantee the `boatswains-bilge` combinators provide, here specialised to
files.

## Whole-file or scoped?

Reach for `file-contents` / `file-lines` / `set-file-contents` /
`set-file-lines` when the file is small enough to hold in memory and you want
the whole thing at once. Reach for the `with-…` openers when you need to append,
to stream a large file a line at a time with `readln`, or to interleave reads
and writes — anywhere holding the entire file in memory would be wasteful or
wrong.

[io.files]: https://docs.factorcode.org/content/vocab-io.files.html
[utf8]: https://docs.factorcode.org/content/vocab-io.encodings.utf8.html
[stream-protocol]: https://docs.factorcode.org/content/article-stream-protocol.html
