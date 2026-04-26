# Introduction

Factor's associative arrays — hashtables and friends — share a
common protocol from [`assocs`][assocs]. The hashtable literal is
`H{ }`:

```factor
H{ { "coal" 1 } { "wood" 2 } } .

"coal" H{ { "coal" 1 } { "wood" 2 } } at .   ! => 1
"gold" H{ { "coal" 1 } { "wood" 2 } } at .   ! => f
```

Common ops:

```
at        ( key assoc -- value/f )
key?      ( key assoc -- ? )
set-at    ( value key assoc -- )
delete-at ( key assoc -- )
inc-at    ( key assoc -- )
change-at ( key assoc quot -- )
>alist    ( assoc -- alist )
```

Hashtables are *mutable* — `clone` an `H{ }` literal before
modifying so the literal isn't shared between calls.

[assocs]: https://docs.factorcode.org/content/vocab-assocs.html
