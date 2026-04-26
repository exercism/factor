# About

A `SYMBOL:` doesn't *hold* a value — it's just a name. The value
lives in a namespace, and the name keys into it.

```factor
USING: namespaces ;

SYMBOL: history

V{ } clone history set-global
"first event" history get-global push
"second event" history get-global push
history get-global .
! => V{ "first event" "second event" }
```

Two scopes:

- **global** — written/read with `set-global`, `get-global`,
  `change-global`. Values persist for the lifetime of the
  process.
- **dynamic** — written/read with `set`, `get`, `change`.
  Bindings live for the duration of a `with-variable` form,
  letting outer code "inject" a value seen by inner code without
  changing every signature in between.

```factor
"verbose" log-level [
    log-level get .   ! => "verbose"
] with-variable
```

`SYMBOL:` and `SYMBOLS:` declare symbols at vocabulary load time,
making them shareable references across files.
