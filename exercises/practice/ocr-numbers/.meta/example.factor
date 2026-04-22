USING: assocs grouping kernel locals math sequences strings ;
IN: ocr-numbers

CONSTANT: digit-patterns H{
    { " _ | ||_|   " CHAR: 0 }
    { "     |  |   " CHAR: 1 }
    { " _  _||_    " CHAR: 2 }
    { " _  _| _|   " CHAR: 3 }
    { "   |_|  |   " CHAR: 4 }
    { " _ |_  _|   " CHAR: 5 }
    { " _ |_ |_|   " CHAR: 6 }
    { " _   |  |   " CHAR: 7 }
    { " _ |_||_|   " CHAR: 8 }
    { " _ |_| _|   " CHAR: 9 }
}

:: recognize-digit ( rows col -- ch )
    4 <iota> [| r |
        3 <iota> [| c | col c + r rows nth nth ] map
    ] map concat >string
    digit-patterns at [ CHAR: ? ] unless* ;

:: recognize-row ( rows -- str )
    rows first length 3 /i <iota>
    [| i | rows i 3 * recognize-digit ] map >string ;

:: convert ( rows -- str )
    rows length 4 mod 0 = not
    [ "Number of input lines is not a multiple of four" throw ] when
    rows first length 3 mod 0 = not
    [ "Number of input columns is not a multiple of three" throw ] when
    rows 4 group
    [ recognize-row ] map "," join ;
