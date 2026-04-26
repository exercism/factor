# Introduction

When a quotation needs to *remember* values from its surroundings,
Factor offers two tools: `curry`/`compose` from [`kernel`][kernel],
and the fry syntax `'[ … ]` from [`fry`][fry].

`curry` bakes one value into the front of a quotation:

```
curry ( value quot -- newquot )
```

```factor
3 [ + ] curry .          ! => [ 3 + ]
10 3 [ + ] curry call .  ! => 13
```

`compose` glues two quotations together:

```factor
[ 1 + ] [ 2 * ] compose .       ! => [ 1 + 2 * ]
5 [ 1 + ] [ 2 * ] compose call . ! => 12
```

For more than one or two captures, fry is cleaner. Each `_`
placeholder is filled, in order, with a value taken off the stack:

```factor
2 3 '[ _ _ + + ] .    ! => [ 2 3 + + ]
```

Fry also reaches into nested quotations.

[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
[fry]: https://docs.factorcode.org/content/vocab-fry.html
