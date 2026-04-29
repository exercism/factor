# Introduction

Integers can be viewed not just as numeric values but as patterns of
bits. Factor's [`math`][math] vocabulary has the standard low-level
operations on those bit patterns, and the [`math.bitwise`][bitwise]
vocabulary adds a few helpers for working with fixed-width values.

## Bit shifts

`shift ( m n -- m' )` shifts the bits of `m`. A *positive* `n` shifts
left (multiplying by 2 each step); a *negative* `n` shifts right
(dividing by 2 each step):

```factor
3 2 shift .     ! => 12   (3 << 2)
24 -3 shift .   ! => 3    (24 >> 3)
```

For positive integers the right-shift drops bits off the bottom and
fills with zeros. For *negative* integers, Factor's `shift` is
arithmetic — it preserves the sign bit, conceptually filling from the
left with copies of the sign bit. (Factor integers are arbitrary
precision, so "the left" extends as far as needed.)

## Bitwise logic

The four basic logic operations are:

```
bitor  ( x y -- z )   ! 1 in either operand
bitand ( x y -- z )   ! 1 in both operands
bitxor ( x y -- z )   ! 1 in exactly one operand
bitnot ( x   -- z )   ! flip every bit
bit?   ( x n -- ? )   ! true when bit at position n is set
```

```factor
0b1011 0b0010 bitor .    ! => 11  (0b1011)
0b1011 0b0010 bitand .   ! => 2   (0b0010)
0b1011 0b0010 bitxor .   ! => 9   (0b1001)
0b1011 bitnot .          ! => -12 (… because Factor uses arbitrary
                         !          precision, so flipping turns
                         !          0b1011 into "all ones with the
                         !          low four flipped to 0100", which
                         !          read as a signed bignum is -12.)
0b1011 0 bit? .          ! => t   (low bit is set)
0b1011 2 bit? .          ! => f   (bit 2 is clear)
```

## Treating a value as N bits

`bits ( x n -- y )` from `math.bitwise` masks `x` to its low `n` bits.
This is the Factor way to "reinterpret a value as an N-bit unsigned
integer":

```factor
-1 8 bits .              ! => 255   (lowest 8 bits of -1 are all 1)
-2144333657 32 bits .    ! => 2150633639
```

That second example matters for this exercise. If you start with a
negative twos-complement Int32 value and want to "logically" right-
shift it (zero-fill from the left) by `amount`, the Factor idiom is:

```
( value -- shifted )
32 bits  amount neg  shift
```

Mask to 32 bits first to switch to the unsigned interpretation, then
shift. Because the masked value is non-negative, `shift` simply drops
bits off the bottom and pads with zeros.

[math]: https://docs.factorcode.org/content/vocab-math.html
[bitwise]: https://docs.factorcode.org/content/vocab-math.bitwise.html
