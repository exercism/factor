# About

Factor's conditionals all take quotations as their branches.

The basic three are in `kernel`:

```
if      ( ? then-quot else-quot -- )
when    ( ? quot -- )
unless  ( ? quot -- )
```

Two starred variants treat the boolean as a value worth using
when it's truthy — the canonical "value-or-`f`" pair:

```
if*     ( ? true false -- )    ! truthy: true called WITH value
unless* ( ? false      -- )    ! falsy: false runs and pushes default
```

```factor
: abs   ( x -- y ) dup 0 < [ neg ] [ ] if ;
: shout ( s -- )   dup empty? [ drop ] [ >upper print ] if ;
```

For more than two branches, `cond` (in `combinators`) walks an
array of `{ predicate body }` pairs and runs the body of the first
predicate that fires. The conventional pattern uses `dup` in each
predicate so the input survives, and the body opens with a `drop`
to discard it before pushing the result:

```factor
{
    { [ dup 0 <  ] [ drop "negative" ] }
    { [ dup 0 =  ] [ drop "zero"     ] }
    [ drop "positive" ]
} cond
```

A trailing entry without a predicate is the default branch.
