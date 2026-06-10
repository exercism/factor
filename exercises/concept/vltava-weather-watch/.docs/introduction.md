# Introduction

A file is just a stream with a name on disk. The [`io.files`][io.files]
vocabulary gives you two ways to work with one: whole-file convenience words
that read or write everything in a single call, and stream openers for when you
want to read or write incrementally.

Every word that touches a file takes an **encoding** — the scheme that turns
bytes into characters and back. For text, that is almost always
[`utf8`][utf8] from `io.encodings.utf8`.

## Reading a whole file

```
file-contents   ( path encoding -- str )
file-lines      ( path encoding -- seq )
```

`file-contents` returns the entire file as one string; `file-lines` returns an
array of its lines, with the line breaks stripped off.

```factor
USING: io.encodings.utf8 io.files prettyprint ;

"sunny\ncloudy\n" "forecast.txt" utf8 set-file-contents

"forecast.txt" utf8 file-contents .
! => "sunny\ncloudy\n"

"forecast.txt" utf8 file-lines .
! => { "sunny" "cloudy" }
```

## Writing a whole file

```
set-file-contents   ( str path encoding -- )
set-file-lines      ( seq path encoding -- )
```

Both **replace** the file's contents (creating it if needed).
`set-file-contents` writes a string verbatim; `set-file-lines` writes each
element of a sequence on its own line, adding the newlines for you.

```factor
USING: io.encodings.utf8 io.files prettyprint ;

{ "sunny" "cloudy" } "forecast.txt" utf8 set-file-lines
"forecast.txt" utf8 file-contents .
! => "sunny\ncloudy\n"
```

## Appending to a file

To add to a file without erasing what is already there, open it with a
`with-…` combinator and write to the ambient stream inside the quotation:

```
with-file-appender   ( path encoding quot -- )
with-file-reader     ( path encoding quot -- )
with-file-writer     ( path encoding quot -- )
```

```factor
USING: io io.encodings.utf8 io.files prettyprint ;

"sunny\ncloudy\n" "forecast.txt" utf8 set-file-contents
"forecast.txt" utf8 [ "rainy" print ] with-file-appender
"forecast.txt" utf8 file-contents .
! => "sunny\ncloudy\nrainy\n"
```

Like every `with-…` combinator, these are destructor scopes: the file handle is
closed when the quotation finishes, even if it throws.

[io.files]: https://docs.factorcode.org/content/vocab-io.files.html
[utf8]: https://docs.factorcode.org/content/vocab-io.encodings.utf8.html
