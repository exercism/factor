# Introduction

Once a value leaves your program — onto a wire, into a log file,
across a socket — it has to be *text*. Three Factor idioms come
up over and over when packing values for transmission: the
serializer `unparse`, the slice variants that view a sequence
without copying, and the multi-input cleave combinators that let
you project several fields off the stack in a single phrase.

```factor
USING: combinators kernel prettyprint sequences strings ;

123 unparse .                          ! => "123"
"NS-1024" 2 head-slice >string .       ! => "NS"
1 2 [ + ] [ - ] 2bi . .
! => -1
! => 3
```

`unparse` is the inverse of Factor's parser — `dup unparse parse`
round-trips. `head-slice` returns a *view* (a `slice` object)
instead of allocating a fresh sequence the way `head` does — useful
when you just need to look at a region. `2bi`, `3bi`, `2tri`, and
`3tri` extend the cleave family to two or three stack inputs.
