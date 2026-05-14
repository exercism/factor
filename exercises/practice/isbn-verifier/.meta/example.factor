USING: kernel math math.order sequences ;
IN: isbn-verifier

: digit-value ( char -- n/f )
    dup CHAR: 0 CHAR: 9 between?
    [ CHAR: 0 - ] [ drop f ] if ;

: char-value ( i char -- n/f )
    swap 9 = [
        dup CHAR: X = [ drop 10 ] [ digit-value ] if
    ] [ digit-value ] if ;

: strip-dashes ( str -- str' )
    [ CHAR: - = ] reject ;

: isbn-values ( str -- values/f )
    dup length 10 = [
        10 <iota> swap [ char-value ] 2map
        dup [ ] all? [ ] [ drop f ] if
    ] [ drop f ] if ;

: weighted-sum ( values -- sum )
    10 <iota> [ 10 swap - ] map
    swap [ * ] 2map
    0 [ + ] reduce ;

: valid? ( isbn -- ? )
    strip-dashes isbn-values
    dup [ weighted-sum 11 mod 0 = ] [ ] if ;
