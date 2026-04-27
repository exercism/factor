USING: arrays kernel math sequences ;
IN: pascals-triangle

: next-row ( row -- next )
    dup 0 prefix swap 0 suffix [ + ] 2map ;

: rows ( count -- triangle )
    dup 0 = [ drop { } ] [
        [ { 1 } 1array ] dip 1 - [ dup last next-row suffix ] times
    ] if ;
