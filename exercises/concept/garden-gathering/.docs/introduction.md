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

(`set` / `get` / `change` operate on the *current* dynamic scope —
useful inside `with-variable`, but for module-level state the
`-global` versions are what you want.)

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
