# Introduction

A *disposable* is anything that holds an OS resource — an open
file, a socket, a hash-table-backed lock — and must be released
when you're done with it. Factor's [`destructors`][destructors]
vocab wraps these in a small framework so cleanup happens even
when an exception unwinds the stack.

```factor
USING: destructors io.files io.encodings.utf8 ;

"log.txt" utf8 <file-writer> [
    "hello, world" write
] with-disposal
! file is closed even if write throws
```

`with-disposal ( disposable quot -- )` runs the quotation with
the resource and disposes it on exit. For more than one resource,
open a scope with `with-destructors` and register each with
`&dispose` (dispose on normal exit *and* on error) or `|dispose`
(dispose only on error).

A class joins the framework by extending `disposable` and
implementing the `dispose*` generic — the framework calls it once
and only once per object. The public word callers use is
`dispose`.

[destructors]: https://docs.factorcode.org/content/vocab-destructors.html
