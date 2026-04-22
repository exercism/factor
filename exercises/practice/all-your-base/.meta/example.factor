USING: kernel locals math sequences ;
IN: all-your-base

:: digits>integer ( digits base -- n )
    0 digits [ [ base * ] dip + ] each ;

:: integer>digits ( n base -- digits )
    n [ dup 0 > ] [ base /mod ] produce nip reverse
    dup empty? [ drop { 0 } ] when ;

:: validate-base ( base msg -- )
    base 2 < [ msg throw ] when ;

:: validate-digits ( digits base -- )
    digits [ dup 0 < swap base >= or ] any?
    [ "all digits must satisfy 0 <= d < input base" throw ] when ;

:: rebase ( digits input-base output-base -- digits' )
    input-base "input base must be >= 2" validate-base
    output-base "output base must be >= 2" validate-base
    digits input-base validate-digits
    digits input-base digits>integer
    output-base integer>digits ;
