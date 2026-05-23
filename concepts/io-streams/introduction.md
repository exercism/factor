# Introduction

Factor reads and writes through [`io`][io] streams. Most code
talks to the *ambient* input and output — words like `read`,
`readln`, `print`, and `write` operate on whatever stream is
currently bound — and a small set of `with-…` combinators
swap that ambient stream in and out for the duration of a
quotation.

```factor
USING: io io.streams.string ;

"hello\nworld" <string-reader> [ readln . readln . ] with-input-stream
! prints "hello"
! prints "world"

[ "captured" print ] with-string-writer .
! prints (returns) "captured\n"
```

`<string-reader>` and `<string-writer>` are the in-memory streams
used in this exercise. `<file-reader>` and `<file-writer>` are
their on-disk counterparts and have the same interface — pair
them with `with-file-reader` / `with-file-writer` for scoped
file access.

[io]: https://docs.factorcode.org/content/vocab-io.html
