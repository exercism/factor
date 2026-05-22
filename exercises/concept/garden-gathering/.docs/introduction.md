# Introduction

Sometimes a piece of state needs to be shared between several words
without threading it through their stack effects every time. Factor's
*dynamic variables* — declared with `SYMBOL:` — give each word
access to a value stored in a namespace.

## `SYMBOL:` and `SYMBOLS:`

`SYMBOL: name` declares one variable. `SYMBOLS: a b c ;` declares
several at once:

```factor
USING: namespaces ;

SYMBOLS: counter total ;
```

## Setting and getting

`set-global` and `get-global` (in [`namespaces`][namespaces]) operate
on the global namespace:

```
set-global    ( value variable -- )
get-global    ( variable -- value )
change-global ( variable quot: ( old -- new ) -- )
```

```factor
0 counter set-global
counter get-global .         ! => 0
counter [ 10 + ] change-global
counter get-global .         ! => 10
```

For module-level state, the `-global` flavours are what you want.

## Scoped bindings with `with-variable`

A dynamic variable also supports a second, *scoped* flavour. `set` /
`get` / `change` (no `-global` suffix) read and write the *current*
dynamic scope, and `with-variable` (in [`namespaces`][namespaces])
creates a fresh scope for the duration of a quotation:

```
with-variable ( value variable quot -- )
set           ( value variable -- )
get           ( variable -- value )
change        ( variable quot: ( old -- new ) -- )
```

The variable is bound to `value` while `quot` runs; once it returns,
the binding disappears. This lets an outer caller "inject" a value
that inner code can read without threading it through every stack
signature.

```factor
SYMBOL: greeting

"Hello" greeting [
    greeting get .                ! => "Hello"
    "Howdy" greeting set
    greeting get .                ! => "Howdy"
    greeting [ "!" append ] change
    greeting get .                ! => "Howdy!"
] with-variable

greeting get-global .    ! => f   (the scoped binding is gone)
```

This exercise uses the global flavour throughout — but recognising
the parallel `set`/`get`/`change` family is useful when you read
other people's code.

## Mutable vectors

Because dynamic variables hold a reference, you can keep a *mutable*
collection inside one and update it in place:

```factor
SYMBOL: history

V{ } clone history set-global
"first event" history get-global push
"second event" history get-global push
history get-global .
! => V{ "first event" "second event" }
```

`V{ … }` is a literal vector. Always `clone` a `V{ }` literal
before storing it: literals are shared between calls.

## `find` — first match

`find` (in [`sequences`][sequences]) returns the first element for
which a predicate is truthy, plus its index:

```
find ( seq quot -- index elt/f )
```

If nothing matches, both values are `f`. Dropping the index with
`nip` and using `unless*` is the standard "default if missing"
combination.

## `reject` — drop the matches

`reject` (also in [`sequences`][sequences]) is the opposite of
`filter`: it returns the elements that *fail* the predicate.

[namespaces]: https://docs.factorcode.org/content/vocab-namespaces.html
[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
