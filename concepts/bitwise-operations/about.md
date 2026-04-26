# About

Factor's integers have arbitrary precision, and the bitwise
operators in [`math.bitwise`][math.bitwise] work just as you'd
expect across the bits of their two's-complement representation.

```factor
USE: math.bitwise

12 10 bitand .   ! => 8     (0b1100 AND 0b1010)
12 10 bitor .    ! => 14    (0b1100 OR  0b1010)
12 10 bitxor .   ! => 6     (0b1100 XOR 0b1010)
12 bitnot .      ! => -13   (two's complement)
1 8 shift .      ! => 256   (left shift)
256 -2 shift .   ! => 64    (right shift, n is negative)
```

Single-bit helpers — `bit?`, `set-bit`, `clear-bit`, `even-parity?`,
`odd-parity?` — sit in the same vocabulary, along with `bit-count`
(popcount) and `bit-length` (the number of bits required).

[math.bitwise]: https://docs.factorcode.org/content/vocab-math.bitwise.html
