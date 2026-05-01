# Introduction

Each Factor source file declares a *vocabulary* with `IN:` and
imports any others it uses with `USING:`.

```factor
USING: kernel sequences ;
IN: my-vocab

: shout ( str -- str ) "!" append ;
```

The directory layout follows the dotted vocab name:

- vocab `my-vocab` lives at `my-vocab/my-vocab.factor`
- vocab `my-vocab.helpers` lives at `my-vocab/helpers/helpers.factor`

Factor's vocabulary loader follows `USING:` declarations
transitively — when a file you require imports another vocab,
that vocab is loaded automatically.

You'll often factor a large routine across two vocabularies: a
helpers vocab with small reusable words, and a main vocab that
imports them and composes the result.
