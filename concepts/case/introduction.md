# Introduction

`case` (in [`combinators`][combinators]) dispatches on a value by
walking an alist of clauses and running the body of the first
matching one.

```
case ( obj assoc -- )
```

```factor
USING: combinators ;

: name-of ( n -- s )
    {
        { 1 [ "one" ] }
        { 2 [ "two" ] }
        [ drop "many" ]
    } case ;
```

Each clause is `{ value [ body ] }`. Equality is by `=`. Matched
clauses run with the input value *already consumed*. A trailing
`[ body ]` (no value) is the default — it runs with the input
*still* on the stack, so the body usually starts with `drop`.

[combinators]: https://docs.factorcode.org/content/vocab-combinators.html
