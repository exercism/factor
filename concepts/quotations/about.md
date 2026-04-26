# About

A quotation, written in `[ ]`, is Factor's analogue of an anonymous
function or a code block. It's a first-class value that you can
push, store, or pass around, and that runs only when something
*calls* it.

```factor
[ 1 + ]              ! a quotation, sitting on the stack
5 [ 1 + ] call .     ! => 6
```

Quotations are sequences of words, and Factor uses them everywhere
a piece of behaviour needs to be deferred or parameterised:

- the branches of `if` / `when` / `unless` / `cond`
- the predicate of `filter`, `count`, `any?`, `all?`
- the transformation of `map`, `each`, `reduce`
- the body of `times`, `while`, `loop`

A quotation's stack effect can usually be inferred. When it can't —
typically when it's stored and `call`ed later — declare the effect
explicitly: `call( a b -- c )`.
