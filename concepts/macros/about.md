# About

A `MACRO:` declaration is a word whose *body* runs at compile
time. The body consumes literal arguments from the compile-time
stack and must leave one quotation on it. The compiler then
substitutes that quotation for the macro call, so the runtime
program never sees the macro — only the code it produced.

```factor
USING: kernel macros sequences ;

MACRO: twice ( quot -- compound )
    dup append ;
```

If a caller writes `[ 1 + ] twice`, the compiler runs the body
with `[ 1 + ]` on the stack, gets back `[ 1 + 1 + ]`, and
splices that in. There's no runtime overhead — the loop or
combinator the macro replaced has vanished.

## Inputs must be literals

Because the body runs at compile time, every input must be a
*literal* at the call site — a `[ … ]` quotation, a number, an
array, a string. Passing a non-literal value (one that's only
known at runtime) is a compile-time error.

```factor
! works: [ 1 + ] is a literal quotation
: inc-twice ( x -- y ) [ 1 + ] twice ;

! refused: f is a literal, but the macro can't run with a non-quotation
! input where the body expects to call `append` on it
```

## Structural inputs drive structural output

The interesting macros take a *structure* (an array, a literal
sequence of pairs) and produce code whose shape depends on that
structure. `each-literal` from this exercise takes a literal
sequence and a quotation, and emits one curried-and-inlined
copy of the quotation per element. The runtime program is
straight-line code — no `each`, no per-element dispatch — and
the sequence iteration happened entirely at compile time.

## Why no hygiene problem

Lisp macros wrestle with *hygiene*: a macro that introduces a
local name can collide with names at the call site, requiring
`gensym` or a hygiene system. Factor doesn't have this problem,
because quotations are sequences of *resolved word references*
— each word is looked up at parse time, not symbolically at
expansion time. A `dup` inside a macro-built quotation will
always be `kernel:dup`, regardless of what names exist at the
call site.

The cost: Factor macros can't introduce new bindings the way
`defmacro` can. They build code from words the parser has
already seen. For most metaprogramming this is enough.

## Adjacent forms (not exercised here)

- `MACRO::` — locals-form variant of `MACRO:`, the same way
  `::` is the locals form of `:`. Useful when the body
  references its inputs more than once.
- `<< … >>` — parse-time evaluation block. Runs ordinary Factor
  at compile time without the quotation-return contract. Useful
  for computing a value that needs to exist at parse time
  (e.g., a `CONSTANT:` derived from an environment lookup).
- `SYNTAX:` — *parsing words*. A different beast — they operate
  on the parser's token stream, not on values, and run at an
  even earlier phase. Used to define new literal syntaxes
  (`T{ }`, `H{ }`). Out of scope for this concept.
- `functor:` — declarative templates that generate sets of
  related words from a single specification. Built atop the
  macro machinery; library-author territory.

[macros]: https://docs.factorcode.org/content/vocab-macros.html
