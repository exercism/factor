USING: combinators formatting kernel math math.order math.parser
sequences ;
IN: line-up

: ordinal-suffix ( n -- str )
    dup 100 mod dup 11 13 between?
    [ 2drop "th" ]
    [ drop 10 mod { { 1 [ "st" ] } { 2 [ "nd" ] } { 3 [ "rd" ] } [ drop "th" ] } case ]
    if ;

: format ( name number -- str )
    dup number>string swap ordinal-suffix append
    "%s, you are the %s customer we serve today. Thank you!" sprintf ;
