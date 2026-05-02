# Introduction

In Factor, you define a new word with `: name ( stack-effect ) body ;`.
The body is a sequence of words; calling your new word runs them in
order.

```factor
USING: kernel ;
IN: my-vocab

: shout ( str -- str ) "!" append ;
```

When a routine grows large, you can — and should — *factor* it: pull
groups of words into smaller named words, each with one job. The
language is named for this.

## Vocabularies

Each `.factor` file declares a vocabulary with `IN:`. Words in one
vocabulary can call words from another by listing the other vocab in
`USING:`.

```factor
! file: my-vocab/helpers/helpers.factor
USING: kernel ;
IN: my-vocab.helpers

: shout-line ( str -- str ) "!" append ;
```

```factor
! file: my-vocab/my-vocab.factor
USING: kernel my-vocab.helpers sequences ;
IN: my-vocab

: announce ( names -- strs )
    [ shout-line ] map ;
```

The directory layout follows the dotted vocab name: vocab `my-vocab`
lives in `my-vocab/my-vocab.factor`; vocab `my-vocab.helpers` lives
in `my-vocab/helpers/helpers.factor`. Factor's loader follows
`USING:` declarations transitively, loading each vocab on demand.
