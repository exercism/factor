USING: kernel math math.parser sequences splitting ;
IN: matrix

: <matrix> ( str -- matrix )
    "\n" split [ " " split harvest [ string>number ] map ] map ;

: nth-row ( matrix n -- row )
    1 - swap nth ;

: nth-column ( matrix n -- column )
    1 - [ swap nth ] curry map ;
