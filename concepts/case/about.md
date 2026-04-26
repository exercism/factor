# About

`case` is Factor's equality-based multi-way switch. It's the right
tool when the choice depends on a *single* value being equal to
one of several alternatives — not when each branch needs a
different test (use `cond` for that).

```factor
USING: combinators ;

SYMBOLS: yes no maybe ;

: invert ( ?/maybe -- ?'/maybe )
    {
        { yes [ no ] }
        { no  [ yes ] }
        [ ]            ! default: leave value alone
    } case ;
```

A few things worth keeping straight:

- Equality is `=`. Anything `=` works as a key — numbers, strings,
  characters, symbols, even tuples.
- *Matched* branches see the stack *without* the input value. *Default*
  branches see it still on top.
- A `case` without a default and no matching clause throws an error.

`case` compiles to a jump table where possible, so it's not just
sugar for an `if` chain — it's also fast.
