USING: kernel locals math sequences ;
IN: roman-numerals

CONSTANT: numerals {
    { 1000 "M" } { 900 "CM" } { 500 "D" } { 400 "CD" }
    { 100 "C" } { 90 "XC" } { 50 "L" } { 40 "XL" }
    { 10 "X" } { 9 "IX" } { 5 "V" } { 4 "IV" } { 1 "I" }
}

:: roman ( n -- str )
    n "" numerals [
        first2 :> ( value symbol )
        :> ( remaining acc )
        remaining value /mod :> ( quotient rest )
        rest
        acc quotient <iota> [ drop symbol ] map concat append
    ] each nip ;
