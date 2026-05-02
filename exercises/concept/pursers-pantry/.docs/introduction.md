# Introduction

Hashtables in Factor are *associative arrays* — collections of
`key/value` pairs with O(1) lookup. They're part of the wider
`assocs` family.

## Hashtable literals

```factor
H{ { "coal" 1 } { "wood" 2 } } .
! => H{ { "coal" 1 } { "wood" 2 } }
```

`H{ }` is an empty hashtable. Unlike arrays, hashtables are *mutable*
— `clone` first if you need to leave the original alone.

## Reading

`at` (in [`assocs`][assocs]) reads a value, returning `f` if the key
is missing:

```
at      ( key assoc -- value/f )
key?    ( key assoc -- ? )
```

```factor
"coal" H{ { "coal" 1 } { "wood" 2 } } at .   ! => 1
"gold" H{ { "coal" 1 } { "wood" 2 } } at .   ! => f
```

## Writing

`set-at` adds or overwrites; `delete-at` removes; `change-at` runs a
quotation over the current value. All three *mutate*:

```
set-at     ( value key assoc -- )
delete-at  ( key assoc -- )
change-at  ( key assoc quot: ( old -- new ) -- )
```

```factor
H{ } clone "coal" over [ 5 swap set-at ] keep .
! => H{ { "coal" 5 } }
```

## `inc-at` — the count-up shortcut

`inc-at` (also in `assocs`) adds 1 to the existing value for a key,
inserting it as 1 when missing. Perfect for tallying:

```
inc-at ( key assoc -- )
```

```factor
H{ } clone "coal" over inc-at .
! => H{ { "coal" 1 } }
```

## Iterating with `each`

Just like sequences, an `each` over a hashtable iterates *and* gives
you a way to do something with each element. For "do this with each
key" you can stick to sequences and pass `seq` to `each` directly.

## Converting back to a sequence

`>alist` (in [`assocs`][assocs]) returns a sequence of `{ key value }`
pairs. `sort-keys` (in [`sorting`][sorting]) returns the same
sequence sorted by key.

```factor
H{ { "wood" 11 } { "coal" 7 } } sort-keys .
! => { { "coal" 7 } { "wood" 11 } }
```

[assocs]: https://docs.factorcode.org/content/vocab-assocs.html
[sorting]: https://docs.factorcode.org/content/vocab-sorting.html
