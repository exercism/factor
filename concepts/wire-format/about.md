# About

Preparing a value for transmission means three things at once:
serializing it, picking the right piece of it out, and not
copying when you don't need to. Three Factor idioms cover that
ground.

## `unparse` — value to source

[`unparse`][prettyprint] (in `prettyprint`) returns the
source-form text of any value. It's the inverse of the parser —
the round-trip `dup unparse parse` reconstructs the value.

```factor
USING: prettyprint ;

{ 1 2 3 } unparse .   ! => "{ 1 2 3 }"
"hi" unparse .        ! => "\"hi\""
123 unparse .         ! => "123"
```

Contrast with `>string` (which only works on character sequences)
and `number>string` (numbers only). `unparse` is the universal
one — at the cost of producing Factor syntax (quoted strings keep
their quotes), so it's the right tool when the receiver will parse
the text back, and the wrong tool for human-readable output.

## Slices — views, not copies

| word          | effect                                         |
|---------------|------------------------------------------------|
| `head`        | `( seq n -- newseq )` — copies first n          |
| `head-slice`  | `( seq n -- slice )` — view of first n          |
| `tail`        | `( seq n -- newseq )` — copies from index n on  |
| `tail-slice`  | `( seq n -- slice )` — view from index n on     |
| `head*`       | `( seq n -- newseq )` — copies all but last n   |
| `head-slice*` | `( seq n -- slice )` — view of all but last n   |
| `tail*`       | `( seq n -- newseq )` — copies last n           |
| `tail-slice*` | `( seq n -- slice )` — view of last n           |

A `slice` is a tuple holding a from-index, to-index, and the
underlying sequence — it implements the sequence protocol so any
sequence operation works on it. Reach for the slice variants when
you'd otherwise allocate just to read; reach for the copying ones
when you need to keep the data after the underlying sequence
might change.

## Multi-input cleave — `2bi`, `3bi`, `2tri`, `3tri`

The plain cleave words `bi` and `tri` apply two or three
quotations to *one* input on the stack. The `2`-prefixed and
`3`-prefixed variants apply each quotation to *two* or *three*
inputs:

```
bi   ( x       p q   -- )
2bi  ( x y     p q   -- )
3bi  ( x y z   p q   -- )

tri  ( x       p q r -- )
2tri ( x y     p q r -- )
3tri ( x y z   p q r -- )
```

Each quotation receives *all* the inputs — so use `2bi` when
both projections depend on the pair, not when you want the same
projection applied to each input separately (that's `bi@`).

```factor
1 2 [ + ] [ * ] 2bi . .       ! => 2  3   (both use 1 and 2)
1 2 3 [ + + ] [ * * ] 3bi . . ! => 6  6
```

[prettyprint]: https://docs.factorcode.org/content/vocab-prettyprint.html
