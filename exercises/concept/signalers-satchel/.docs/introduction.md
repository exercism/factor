# Introduction

A *signaler* aboard a coastal patrol vessel maintains the
message log. Raw signal flags come in framed with marker
characters; readings have to be rendered for the wire; pairs and
triples of observations get summarised on the fly. A handful of
idioms from Factor's standard library do most of the work.

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
underlying sequence — that implements the [sequence protocol][sequence-protocol]
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

## `?head` and `?tail` — strip a marker if present

Framed readings carry marker text that may or may not be there.
`?head` and `?tail` (in `splitting`) try to strip a prefix or
suffix, returning the (possibly shortened) sequence *and* a
boolean reporting whether the marker was found:

```
?head ( seq begin -- newseq ? )   ! strip prefix begin if present
?tail ( seq end   -- newseq ? )   ! strip suffix end if present
```

```factor
"NS-1024" "NS-" ?head   ! ( -- "1024" t )      matched, prefix removed
"NS-1024" "XX-" ?head   ! ( -- "NS-1024" f )   no match, sequence unchanged
```

The trailing boolean makes them a natural fit for a guard: pair
`?head` with `if` to branch on whether the frame was present, or
with `unless` to reject input that lacks the expected marker.

## `<repetition>` — N copies, virtually

[`<repetition>`][repetition] (in `sequences`) is another
non-copying virtual sequence — `( len elt -- repetition )`
builds a sequence of `len` elements that are all `elt`, without
allocating that many slots:

```factor
USING: sequences strings ;

5 CHAR: - <repetition> >string . ! => "-----"
3 0 <repetition> >array .        ! => { 0 0 0 }
```

The `elt` can itself be a sequence — each copy is that same
sequence. `concat` then joins the copies end to end:

```factor
USING: sequences ;

2 { 1 2 } <repetition> >array . ! => { { 1 2 } { 1 2 } }
3 "ab" <repetition> concat .    ! => "ababab"
4 { "on" "off" } <repetition> concat .
! => { "on" "off" "on" "off" "on" "off" "on" "off" }
```

Like a `slice`, the result *is* a sequence — `length`, `each`,
and friends work on it directly. Reach for it to pad a signal
code to a fixed width or to lay down a run of repeated markers;
coerce with `>string` (or `>array`) only when a concrete
sequence is actually needed.

## `<clumps>` — overlapping windows, virtually

[`<clumps>`][clumps] (in `grouping`) is a third non-copying
virtual sequence — `( seq n -- clumps )` views `seq` as the
series of *overlapping* length-`n` windows over it, each window a
slice:

```factor
USING: grouping math sequences ;

! each window is a slice; map >array to view them concretely
{ 1 2 3 4 } 2 <clumps> [ >array ] map .
! => { { 1 2 } { 2 3 } { 3 4 } }

! the usual move is to project straight from each window
{ 1 2 3 4 } 2 <clumps> [ first2 + ] map .
! => { 3 5 7 }
```

A sequence of `length` n yields `length - n + 1` windows.
Because each window is a slice, pairing successive readings costs
no copying — `[ first2 ]` on each `2`-clump gives you every
consecutive pair to project from. (The non-overlapping cousin,
`<groups>`, chops the sequence into disjoint blocks instead.)

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
[repetition]: https://docs.factorcode.org/content/word-__lt__repetition__gt__%2Csequences.html
[clumps]: https://docs.factorcode.org/content/word-__lt__clumps__gt__%2Cgrouping.html
[sequence-protocol]: https://docs.factorcode.org/content/article-sequence-protocol.html
