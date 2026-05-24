# Introduction

A *signaler* aboard a coastal patrol vessel maintains the
message log. Raw signal flags come in framed with marker
characters; readings have to be rendered for the wire; pairs and
triples of observations get summarised on the fly. Three idioms
from Factor's standard library do most of the work.

## `unparse` — value to source

[`unparse`][unparse] (in `prettyprint`) returns the
source-form text of any value:

```factor
123 unparse .        ! => "123"
"hi" unparse .       ! => "\"hi\""
{ 1 2 3 } unparse .  ! => "{ 1 2 3 }"
f unparse .          ! => "f"
```

`unparse` is the inverse of the parser — the round-trip
`dup unparse parse` reconstructs the value. It's the right tool
for serialising to a wire format the receiver will parse back,
and the wrong tool for human-readable output (strings keep their
quotes, vectors keep their `V{ ... }`, etc.).

## Slice variants — views, not copies

`head` and `tail` from `sequences` *copy* the part you keep into
a fresh sequence. Their `-slice` counterparts return a `slice`
object — a tuple holding from-index, to-index, and the
underlying sequence — that implements the sequence protocol
without copying:

| word          | effect                                          |
|---------------|-------------------------------------------------|
| `head`        | `( seq n -- newseq )` — copies first n           |
| `head-slice`  | `( seq n -- slice )` — view of first n           |
| `tail`        | `( seq n -- newseq )` — copies from index n on   |
| `tail-slice`  | `( seq n -- slice )` — view from index n on      |
| `head*`       | `( seq n -- newseq )` — copies all but last n    |
| `head-slice*` | `( seq n -- slice )` — view of all but last n    |
| `tail*`       | `( seq n -- newseq )` — copies last n            |
| `tail-slice*` | `( seq n -- slice )` — view of last n            |

```factor
USING: kernel sequences strings ;

"NS-1024" 2 head-slice  >string .  ! => "NS"
"NS-1024" 2 tail-slice  >string .  ! => "-1024"
"NS-1024" 1 head-slice* >string .  ! => "NS-102"
```

A `slice` *is* a sequence, so anything that takes a sequence
takes a slice — `length`, `first`, `each`, and so on all work
without copying. Tests that need to compare against a literal
string can coerce with `>string`.

## Multi-input cleave — `2bi`, `3bi`, `2tri`, `3tri`

The plain cleave words `bi` and `tri` apply two or three
quotations to *one* input. The `2`-prefixed and `3`-prefixed
variants apply each quotation to *two* or *three* inputs:

```
bi   ( x       p q   -- )   ! 2 quotations of 1 input
2bi  ( x y     p q   -- )   ! 2 quotations of 2 inputs each
3bi  ( x y z   p q   -- )   ! 2 quotations of 3 inputs each

tri  ( x       p q r -- )   ! 3 quotations of 1 input
2tri ( x y     p q r -- )   ! 3 quotations of 2 inputs each
3tri ( x y z   p q r -- )   ! 3 quotations of 3 inputs each
```

Each quotation receives *all* the inputs. Use these when more
than one projection depends on the same pair (or triple) of
values — not when you want the *same* operation applied to each
input separately (that's `bi@` or `tri@`).

```factor
USING: combinators math ;

3 4 [ + ] [ * ] 2bi . .
! => 12
! => 7

1 2 3 [ + + ] [ * * ] 3bi . .
! => 6
! => 6
```

[unparse]: https://docs.factorcode.org/content/word-unparse%2Cprettyprint.html
