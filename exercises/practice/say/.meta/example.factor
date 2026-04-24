USING: kernel locals math math.order sequences strings ;
IN: say

CONSTANT: ones { "zero" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine"
    "ten" "eleven" "twelve" "thirteen" "fourteen" "fifteen" "sixteen" "seventeen" "eighteen" "nineteen" }

CONSTANT: tens { f f "twenty" "thirty" "forty" "fifty" "sixty" "seventy" "eighty" "ninety" }

: say-below-100 ( n -- str )
    dup 20 < [ ones nth ] [
        10 /mod swap tens nth
        swap dup 0 = [ drop ] [ ones nth "-" glue ] if
    ] if ;

: say-below-1000 ( n -- str )
    dup 100 < [ say-below-100 ] [
        100 /mod swap ones nth " hundred" append
        swap dup 0 = [ drop ] [ say-below-100 " " glue ] if
    ] if ;

:: say-chunk ( str n scale name -- str' remainder )
    n scale /mod :> ( q r )
    q say-below-1000 " " name 3append
    str empty? [ ] [ str " " rot 3append ] if
    r ;

: say-positive ( n -- str )
    "" swap
    dup 1000000000 >= [ 1000000000 "billion" say-chunk ] when
    dup 1000000 >= [ 1000000 "million" say-chunk ] when
    dup 1000 >= [ 1000 "thousand" say-chunk ] when
    dup 0 > [ say-below-1000 swap dup empty? [ drop ] [ " " rot 3append ] if ] [ drop ] if ;

: say ( n -- str )
    dup 0 999999999999 between? [ "input out of range" throw ] unless
    dup 0 = [ drop "zero" ] [ say-positive ] if ;
