# Introduction

Bitwise operators on integers live in [`math.bitwise`][math.bitwise]:

```
bitand ( x y -- z )    ! AND
bitor  ( x y -- z )    ! OR
bitxor ( x y -- z )    ! XOR
bitnot ( x -- y )      ! NOT
shift  ( x n -- y )    ! left if n>0, right if n<0
```

```factor
USE: math.bitwise

12 10 bitand .    ! => 8
12 10 bitor .     ! => 14
1 4 shift .       ! => 16
16 -2 shift .     ! => 4
```

`even-parity?` and `odd-parity?` report whether the number of set bits
is even or odd:

```factor
USE: math.bitwise

5 even-parity? .    ! => t   (0b101 has two set bits)
5 odd-parity? .     ! => f
7 odd-parity? .     ! => t   (0b111 has three set bits)
```

Single-bit helpers are also there: `bit?`, `set-bit`, `clear-bit`.

[math.bitwise]: https://docs.factorcode.org/content/vocab-math.bitwise.html
