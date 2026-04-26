# About

`TUPLE:` declares a class with named slots. Factor automatically
generates a constructor word (with the class name suffixed `new`),
a `boa` ("by order of arguments") constructor, a literal syntax
`T{ class … }`, and per-slot accessor words.

```factor
TUPLE: player
    { name initial: f }
    { level initial: 0 }
    { health initial: 100 } ;

player new .                                    ! T{ player }
3 100 "Merlin" player boa .                     ! by-order construction
T{ player { name "Merlin" } { health 50 } } .   ! literal syntax
```

The accessor system in [`accessors`][accessors] supplies four
flavours per slot — `name>>`, `>>name`, `change-name`, and the
mutating-pair `[ … ] change-name`. `>>name` and `change-name`
mutate the tuple; `clone` first when you need to leave the
original alone.

Tuples support `=` by structural equality and print with their
non-default slot values shown.

[accessors]: https://docs.factorcode.org/content/vocab-accessors.html
