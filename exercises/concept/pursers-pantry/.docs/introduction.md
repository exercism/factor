# Introduction

Hashtables in Factor are *associative arrays* — collections of
`key/value` pairs with O(1) lookup. They're part of the wider
`assocs` family.

## Hashtable literals

```factor
H{ { "coal" 1 } { "wood" 2 } } .
```

`H{ }` is an empty hashtable. Unlike arrays, hashtables are *mutable*
— `clone` first if you need to leave the original alone. Printing a
hashtable shows its entries, but the order isn't tied to insertion
order — hashtables are unordered.

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
H{ } clone 5 "coal" pick set-at .
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

## Iteration and lazy insertion

`assoc-each` walks every `( key value -- )` pair; `cache`
returns the value for a key, computing it once with the
supplied quotation if the key is missing.

```
assoc-each ( assoc quot: ( key value -- ) -- )
cache      ( key assoc quot: ( key -- value ) -- value )
```

`cache` is the "look up or create" pattern in one word — handy
when you're building a hashtable from a stream of keys and don't
want to handle the missing-entry case at every call site.

## Applying a hashtable update across a sequence of keys

When the input is a sequence of keys and you want to update the
hashtable once per key, iterate the *sequence* with `each` and use
a fried quotation `'[ _ … ]` (from [`fry`][fry]) to bake the
hashtable into the loop body. For example, removing a list of keys:

```factor
{ "wood" "iron" } H{ { "coal" 5 } { "wood" 3 } { "iron" 2 } } clone
[ '[ _ delete-at ] each ] keep .
! => H{ { "coal" 5 } }
```

`'[ _ delete-at ]` captures the hashtable above it on the stack so
that on every iteration `each` only needs to supply the key.
`keep` runs the quotation while preserving the hashtable for the
final `.`.

## Converting back to a sequence

`>alist` (in [`assocs`][assocs]) returns a sequence of `{ key value }`
pairs. `sort-keys` (in [`sorting`][sorting]) returns the same
sequence sorted by key.

```factor
H{ { "wood" 11 } { "coal" 7 } } sort-keys .
! => { { "coal" 7 } { "wood" 11 } }
```

[assocs]: https://docs.factorcode.org/content/vocab-assocs.html
[fry]: https://docs.factorcode.org/content/article-fry.html
[sorting]: https://docs.factorcode.org/content/vocab-sorting.html
