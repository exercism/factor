# Introduction

`MACRO:` declares a word whose *body runs at compile time* and
returns a quotation. The compiler substitutes that quotation
for the macro call — there's no macro left at runtime, only
the code it produced.

```factor
USING: kernel macros sequences ;

MACRO: twice ( quot -- compound )
    dup append ;
```

A caller that writes `[ 1 + ] twice` is compiled as if it had
written `1 + 1 +` — the compiler runs the body with `[ 1 + ]`
on its stack, the body returns `[ 1 + 1 + ]`, and that quotation
gets spliced in.

## Inputs are literals at the call site

Because the body runs at compile time, every input must be a
*literal*: a `[ … ]` quotation, a number, an array, a string.
Pass a non-literal (a value only known at runtime) and the
compiler refuses to specialise.

## Why quotations make this simple

Factor's quotations are sequences of *resolved word references*.
Each `dup`, `+`, or `append` inside a quotation has already
been looked up by the parser. So the macro body is just
ordinary sequence-manipulation code, using words like `append`,
`concat`, `<repetition>`, `curry`, and `>quotation` to build
the result:

| build       | with                                            |
|-------------|-------------------------------------------------|
| `[ A B ]` from `[ A ]` and `[ B ]` | `append` (in `twice`)       |
| `[ A A A ]` (N times) | `swap <repetition> concat >quotation` (in `repeat-quot`) |
| flatten `{ [ A ] [ B ] [ C ] }` | `concat >quotation` (in `compose-many`) |
| `[ A ]` per element of `{ x y z }`  | `[ curry ] curry map concat >quotation` (in `each-literal`) |

There's no separate quote/unquote ceremony and no hygiene
problem to navigate — the words bake in at parse time.

## A close cousin: `<< … >>`

`<< code >>` runs ordinary Factor at compile time without the
quotation-return contract. Useful when you need a value to
exist at parse time but don't need to generate code from it.

```factor
USING: calendar ;

CONSTANT: build-time << now >>
```

Mentioned for completeness — the tasks below all use `MACRO:`.

[macros]: https://docs.factorcode.org/content/vocab-macros.html
