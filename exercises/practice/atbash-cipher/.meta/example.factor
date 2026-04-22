USING: grouping kernel math math.order sequences strings unicode ;
IN: atbash-cipher

: lower-char ( ch -- ch )
    dup CHAR: A CHAR: Z between? [ CHAR: A - CHAR: a + ] when ;

: atbash-char ( ch -- ch )
    dup Letter? [ lower-char CHAR: a - CHAR: z swap - ] when ;

: atbash-core ( phrase -- seq )
    [ dup Letter? swap digit? or ] filter
    [ atbash-char ] map ;

: encode ( phrase -- str )
    atbash-core 5 group [ >string ] map " " join ;

: decode ( phrase -- str )
    atbash-core >string ;
