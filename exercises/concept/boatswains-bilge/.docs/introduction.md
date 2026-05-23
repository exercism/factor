# Introduction

Pumps, valves, hoses — anything that holds an OS handle has to
be *released* when you're done with it. Factor's
[`destructors`][destructors] vocab wraps these in a framework
that guarantees cleanup, even when an exception unwinds the
stack midway through a routine.

## The class and the generic

A class joins the framework by extending `disposable` and
implementing the `dispose*` generic:

```factor
USING: accessors destructors kernel ;

TUPLE: pump < disposable opened ;

: <pump> ( -- pump )
    pump new-disposable t >>opened ;

M: pump dispose* f >>opened drop ;
```

`new-disposable ( class -- obj )` allocates the tuple *and*
registers it with the framework — an exception between
allocation and the next safe point can't leak the resource. The
framework guarantees `dispose*` runs **at most once** per
object — repeated `dispose` calls are no-ops.

## Public callers use `dispose`

```
dispose          ( obj -- )                ! release; safe to call twice
with-disposal    ( disposable quot -- )    ! scope one resource
with-destructors ( quot -- )               ! open a registry scope
&dispose         ( obj -- obj )            ! dispose on normal *or* failure exit
|dispose         ( obj -- obj )            ! dispose only if the scope unwinds
```

`with-disposal` is the single-resource form: it pushes the
disposable for the inner quotation and releases it on exit.

```factor
USING: destructors io ;

<pump> [
    "pumping" print
] with-disposal
! pump released on the way out — even if `print` had thrown
```

For more than one resource, open a `with-destructors` scope and
register each acquisition. `&dispose` (ampersand) means "always
dispose on the way out, success or failure." `|dispose` (pipe)
means "dispose **only** on failure" — useful when the success
path hands the resource off to a caller who'll take ownership.

```factor
[
    <pump> &dispose
    <pump> &dispose
    ! ... use the pumps ...
] with-destructors
! both pumps released
```

For a bare try/finally without a registry, [`cleanup`][cleanup]
(in `continuations`) is the lower-level primitive — but
`with-destructors` is the idiomatic modern Factor.

[destructors]: https://docs.factorcode.org/content/vocab-destructors.html
[cleanup]: https://docs.factorcode.org/content/word-cleanup%2Ccontinuations.html
