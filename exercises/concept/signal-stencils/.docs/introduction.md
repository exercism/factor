# Introduction

You already know how to *build* a quotation out of pieces and run
it. A quotation is just a sequence of code, so the sequence words
you know apply to it:

```factor
USING: kernel math prettyprint quotations sequences ;

{ [ 1 ] [ 2 + ] [ 3 * ] } concat >quotation call .   ! => 9
[ 1 + ] dup append .                                 ! => [ 1 + 1 + ]
```

`append` joins two quotations, `concat` flattens an array of them,
`map` turns data into quotations, and `>quotation` makes the
result callable. `MACRO:` takes that exact skill and moves it to
**compile time**.

## What a macro is

A `MACRO:` definition looks like an ordinary word, but its body
runs *while your program is being compiled*, not while it runs.
The body must leave **one quotation** on the stack. The compiler
then **splices that quotation into the call site** — it replaces
the macro call with the code the body produced. At runtime there
is no macro left, only the generated code.

```factor
USING: kernel macros sequences ;

MACRO: twice ( quot -- spliced )
    dup append ;
```

Wherever you write `[ 1 + ] twice`, the compiler:

1. runs the body with `[ 1 + ]` on the stack,
2. `dup append` builds the quotation `[ 1 + 1 + ]`,
3. splices its code, `1 + 1 +`, into that spot.

So a word that calls `twice` compiles as if you had written
`1 + 1 +` by hand:

```factor
: inc-twice ( x -- y ) [ 1 + ] twice ;

5 inc-twice .   ! => 7
```

The key contrast: a normal word that takes a quotation `call`s it
at runtime. A macro never calls anything — it hands the compiler
*new code* to compile in its place.

## Inputs must be literals

Because the body runs at compile time, a macro's inputs must be
known *then*. They have to be **literals** at the call site — a
`[ … ]` quotation, a number, an array, a string. A value that only
exists at runtime cannot be handed to a macro.

```factor
! DOCTEST: SKIP — illustrative call sites, not standalone code
[ 1 + ] twice          ! ok: the quotation is a literal
[ 1 + ] 3 repeat-quot  ! ok: the quotation and the number are literals
```

## The toolkit

A macro body is ordinary code that returns a quotation. Words you
have already met do most of the work:

| to build…                              | use                  |
|----------------------------------------|----------------------|
| `[ A B ]` from `[ A ]` and `[ B ]`     | `append`             |
| one quotation from an array of them    | `concat >quotation`  |
| a quotation per element of a sequence  | `map`, then `concat >quotation` |

Two more words, from `sequences` and `kernel`, complete the kit.

**`<repetition>`** (in `sequences`) makes a sequence of `n` copies
of one element. Its stack effect is `( length elt -- repetition )`
— the count comes first. The result is a *virtual* sequence, so
flatten it the usual way:

```factor
3 [ 1 + ] <repetition> concat >quotation .   ! => [ 1 + 1 + 1 + ]
```

**`curry`** (in `kernel`) prepends a value to a quotation,
producing a new quotation that pushes that value first:

```factor
3 [ + ] curry .          ! => [ 3 + ]
{ 1 2 3 } [ . ] curry .  ! => [ { 1 2 3 } . ]
```

`curry` is how you bake one specific element into a quotation —
exactly what turns `{ 10 20 30 }` and `[ + ]` into
`[ 10 + ] [ 20 + ] [ 30 + ]`.

## Why this is simpler than it sounds

In some languages, macros need special quote/unquote syntax and
extra machinery to avoid name clashes. Factor needs none of that:
a quotation is already a sequence of *resolved* words — the parser
looked up each `dup`, `+`, and `append` when it read the `[ … ]`.
So a macro body is just the sequence manipulation you already do,
that happens to return a quotation.

## A close cousin: `<< … >>`

`<< code >>` runs ordinary Factor at compile time *without* the
return-a-quotation contract — handy when you only need a value to
exist at parse time:

```factor
! DOCTEST: SKIP — compile-time value, shown for contrast
USING: calendar ;

CONSTANT: build-time << now >>
```

It is mentioned for completeness. The four stencils you'll write —
`twice`, `repeat-quot`, `compose-many`, and `each-literal` — are
all `MACRO:` declarations.

[macros]: https://docs.factorcode.org/content/vocab-macros.html
