USING: kernel sequences ;
IN: reverse-string

: reverse-string ( str -- str )
    dup empty? [ "" [ prefix ] reduce ] unless ;
