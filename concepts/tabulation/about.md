# About

Factor's `<iota>` produces a *virtual* sequence of the integers
`0, 1, …, n-1`. Walking it with `map` yields a tabulated sequence
where each element is a function of its position:

```factor
USING: math sequences ;

5 <iota> [ sq ] map .         ! => { 0 1 4 9 16 }
8 <iota> [ 1 + ] map .        ! => { 1 2 3 4 5 6 7 8 }
```

Two pieces let you turn a sequence of integer codes into a
string:

| word      | role                                                    |
|-----------|---------------------------------------------------------|
| `CHAR:`   | parse-time literal that pushes a character's code point |
| `>string` | convert a sequence of code points to a string           |

Combined, they form the standard idiom for building a row of
characters indexed by position:

```factor
USING: kernel math sequences strings ;

10 <iota> [ 2 mod zero? [ CHAR: O ] [ CHAR: . ] if ] map >string .
! => "O.O.O.O.O."
```

Choosing the character with `if` (or `?`) inside the quotation
keeps the per-position decision close to the index it depends on.
