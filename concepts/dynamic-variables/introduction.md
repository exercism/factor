# Introduction

Sometimes a piece of state needs to be shared between several words
without threading it through their stack effects every time.
Factor's *dynamic variables* — declared with `SYMBOL:` — give every
word access to a value stored in a namespace.

```factor
USING: namespaces ;

SYMBOL: counter

0 counter set-global
counter [ 1 + ] change-global
counter get-global .       ! => 1
```

`set-global` and `get-global` operate on the global namespace.
`set` and `get` operate on the *current* dynamic scope and are
typically used inside a `with-variable` block when you want a
scoped binding rather than a process-wide one.

`SYMBOLS: a b c ;` declares several symbols at once.
