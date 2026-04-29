# Introduction

Almost every Factor program is a sequence of words consuming and
producing values on the *data stack*. When inputs and outputs line
up neatly, the code reads left-to-right with no fuss. When they
don't, you reach for *shuffle words* — and the code gets noisy fast.

This exercise walks you through Factor's standard fix: combinators.

## Shuffle words

The most common shuffle words live in [`kernel`][kernel]:

```
dup    ( x -- x x )
dupd   ( x y -- x x y )
drop   ( x -- )
swap   ( x y -- y x )
swapd  ( x y z -- y x z )
over   ( x y -- x y x )
pick   ( x y z -- x y z x )
rot    ( x y z -- y z x )
-rot   ( x y z -- z x y )
rotd   ( w x y z -- w y z x )
spin   ( x y z -- z y x )
nip    ( x y -- y )
tuck   ( x y -- y x y )

2dup   ( x y -- x y x y )
3dup   ( x y z -- x y z x y z )
4dup   ( w x y z -- w x y z w x y z )
2drop  ( x y -- )
2nip   ( x y z -- z )
2swap  ( x y z w -- z w x y )
```

You'll already have used `dup` and `swap`. `over` makes a copy of
the *second* element from the top — handy when the same input
needs to feed two computations:

```factor
! Sum a number with twice itself: x + 2*x
: triple ( x -- 3x ) dup 2 * + ;
```

That's fine for one use. But strung together, sequences of `dup`,
`swap`, `over`, `rot` quickly become unreadable.

## `keep` — preserve the input

`keep` (in [`kernel`][kernel]) calls a quotation on the top of the
stack but leaves the original value below the result:

```
keep ( x quot: ( x -- y ) -- y x )
```

```factor
5 [ 2 * ] keep .s
! => 10
! => 5
```

That replaces a `dup`-followed-by-something-then-shuffle
pattern: anywhere you'd write `dup [ something ] dip`, you can
just say `[ something ] keep`.

## `bi` — two functions of one input

`bi` (in [`kernel`][kernel]) applies *two* quotations to the same
value, leaving both results on the stack:

```
bi ( x q1 q2 -- r1 r2 )
```

```factor
4 [ sq ] [ neg ] bi .s
! => 16
! => -4
```

Without `bi` you'd write `dup sq swap neg` — readable enough for
two operations, gnarly for three.

## `tri` and `cleave` — many functions of one input

`tri` extends `bi` to three quotations:

```
tri ( x q1 q2 q3 -- r1 r2 r3 )
```

`cleave` (in [`combinators`][combinators]) is the same idea for an
*array* of any number of quotations:

```factor
4 { [ ] [ sq ] [ neg ] } cleave .s
! => 4
! => 16
! => -4
```

The empty quotation `[ ]` acts as the identity — useful when one of
the slots in the cut card should be the input itself.

## `dip` and `2dip` — operate underneath

`dip` (in [`kernel`][kernel]) calls a quotation on the values *under*
the top of stack, leaving the top untouched. `2dip` does the same
but protects the top *two* values:

```
dip  ( x   quot -- x   )
2dip ( x y quot -- x y )
```

```factor
9 10 11 [ + ] dip .s
! => 19      (9 + 10)
! => 11      (the protected top, restored)

9 10 11 12 [ + ] 2dip .s
! => 19      (9 + 10)
! => 11      (the protected y, originally 11)
! => 12      (the protected x, originally 12)
```

Here `dip` hid `11`, ran `9 10 +`, and put `11` back on top.
`2dip` hid `11 12`, ran `9 10 +` underneath, then restored
`11 12`.

`dip` is the right tool when the natural argument order leaves the
"pass-through" value on top of the stack. Reach for it instead of
the `swap … swap` sandwich.

## `bi@` — same operation on two values

`bi@` (in [`kernel`][kernel]) applies one quotation to two stack
values:

```
bi@ ( x y quot -- r1 r2 )
```

```factor
3 4 [ sq ] bi@ .s
! => 9
! => 16
```

Compare with `bi*`, which applies *different* quotations to the
two values.

[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
[combinators]: https://docs.factorcode.org/content/vocab-combinators.html
