# Introduction

Factor's error system has three pieces: `throw` to signal an error,
`recover` to handle one, and `ERROR:` to define a tuple-typed error
class.

## `throw`

`throw` (in [`kernel`][kernel]) raises an error. The argument can be
*any* value — a string, a number, or a tuple — and it becomes the
error you can later inspect:

```factor
"file not found" throw
```

`throw` does not return; the rest of the current word is skipped.

## `recover`

`recover` (in [`continuations`][continuations]) is Factor's
try/catch. It takes a *try* quotation and a *recovery* quotation:

```
recover ( try recovery -- )
```

If `try` finishes without throwing, `recovery` is ignored. If `try`
throws, the error is pushed onto the stack and `recovery` is run:

```factor
[ "boom" throw ] [ drop "caught" ] recover
! => "caught"

[ "ok" ] [ drop "never runs" ] recover
! => "ok"
```

`when` from [`kernel`][kernel] is the natural companion: it runs a
quotation only when the top of stack is truthy:

```factor
: check-positive ( n -- )
    0 < [ "negative!" throw ] when ;
```

## `ERROR:`

`ERROR:` defines a tuple class *and* a word that constructs a fresh
instance and throws it:

```factor
ERROR: not-found path ;

"/missing" not-found
! throws T{ not-found { path "/missing" } }
```

A no-slot error is just `ERROR: name ;` — calling `name` throws an
empty instance. Tuples defined with `ERROR:` carry a class predicate
`name?` you can use to test whether a caught error was of that type.

[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
[continuations]: https://docs.factorcode.org/content/vocab-continuations.html
