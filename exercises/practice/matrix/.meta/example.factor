USING: kernel math math.parser sequences splitting ;
IN: matrix

: <matrix> ( str -- matrix )
    "\n" split [ " " split harvest [ string>number ] map ] map ;

: nth-row ( str n -- row )
    [ <matrix> ] dip 1 - swap nth ;

: nth-column ( str n -- column )
    [ <matrix> ] dip 1 - [ swap nth ] curry map ;
