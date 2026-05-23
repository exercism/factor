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

## Combining quotations

```
compose ( quot1 quot2 -- compound )
curry   ( value quot  -- curried )
```

`compose` concatenates two quotations end-to-end into a new
quotation that runs the first, then the second. `curry` prepends
a fixed value, returning a quotation that will push that value
before invoking the original. Both produce ordinary quotations
you can `call`, store, or pass to combinators.

```factor
USING: kernel math ;

3 [ 2 * ] [ 1 + ] compose call .   ! 3 2 * 1 + => 7
5 [ 1 + ] curry call .             ! 5 1 +     => 6
```
