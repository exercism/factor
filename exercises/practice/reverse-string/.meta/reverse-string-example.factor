USING: kernel sequences ;
IN: reverse-string

: reverse-string ( str -- newstr )
  dup empty? [ "" [ prefix ] reduce ] unless ;

