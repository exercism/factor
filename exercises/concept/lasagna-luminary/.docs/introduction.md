# Introduction

Stack juggling is fine for short words. When a word has several
inputs and you need to refer to them by name, Factor offers
*locals* — named bindings introduced with `::` (for word
definitions) or `[| | ]` (for inline lambdas).

## `:: ( inputs -- outputs )`

Replace `:` with `::` and the input names become local variables in
the body:

```factor
USING: locals ;

:: hypotenuse ( a b -- c )
    a a *
    b b *
    + sqrt ;
```

Compare with the stack-shuffling version:

```factor
: hypotenuse ( a b -- c )
    [ sq ] bi@ + sqrt ;
```

Both are valid — locals shine when an input is referenced more than
once or when the order of operations doesn't naturally line up with
stack order.

## Lambdas — `[| inputs | body ]`

Inside a quotation, `[| inputs | body ]` introduces locals that
the body can refer to by name. This is especially useful with
higher-order words like `assoc-map`, whose quotation receives `key`
*and* `value`:

```factor
USING: assocs locals ;

H{ { "a" 1 } { "b" 2 } }
[| key value | key value 10 * ] assoc-map .
! => H{ { "a" 10 } { "b" 20 } }
```

The lambda's stack effect is determined by the input list and what
its body produces.

## When to use locals

Reach for locals when:

- The same input is used in more than one place.
- The natural order of operations doesn't match stack order, and
  the `dup`/`swap`/`rot` to fix it is hard to read.
- You're inside an inline lambda passed to a higher-order word that
  hands you several values at once (as in `assoc-map`).

When the body is a clean linear flow, plain `:` definitions stay
shorter and at least as readable.

## `assoc-map` — one entry at a time

`assoc-map` (in [`assocs`][assocs]) maps a quotation over each
entry of an associative collection:

```
assoc-map ( assoc quot: ( key value -- newkey newvalue ) -- newassoc )
```

A locals lambda is the cleanest way to write the quotation.

## `cond` revisited

When you need to dispatch on `f` *or* on a numeric value, `cond` is
exactly the right shape — no `case` needed because there's no single
value to compare against.

[assocs]: https://docs.factorcode.org/content/vocab-assocs.html
