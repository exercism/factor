# Introduction

When you have several discrete possible values to dispatch on,
`case` (in [`combinators`][combinators]) is a cleaner fit than a
chain of `if`s.

## `case`

```
case ( obj assoc -- )
```

`case` takes the value off the top of the stack and an *assoc* of
clauses. Each clause is `{ value [ body ] }`. The first clause whose
value `=` the input wins; its body runs with the input value
*already consumed*. A trailing entry that's just `[ body ]` is the
default — the input is *still on the stack* when it runs.

```factor
USING: combinators ;

: name-of ( n -- s )
    {
        { 1 [ "one" ] }
        { 2 [ "two" ] }
        [ drop "many" ]
    } case ;
```

Equality is by `=`, so anything that compares equal works as a key
— numbers, strings, and symbols all do.

## `cond` for guarded branches

When the choice depends on a *predicate* rather than equality (e.g.
`x > 11`), `cond` is the matching tool. You met `cond` in
[Cars, Assemble!][cars-assemble].

## Symbols

A `SYMBOL:` declares a word that pushes itself onto the stack — a
self-evaluating tag value. `SYMBOLS:` declares several at once:

```factor
SYMBOLS: yes no maybe ;
```

Now `yes` is a value, comparable with `=`, that you can use as a
case key:

```factor
: invert ( ? -- ?' )
    { { yes [ no ] } { no [ yes ] } [ ] } case ;
```

[combinators]: https://docs.factorcode.org/content/vocab-combinators.html
[cars-assemble]: https://exercism.org/tracks/factor/exercises/cars-assemble
