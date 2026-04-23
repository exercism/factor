USING: arrays grouping kernel math sequences sets sorting ;
IN: triangle

: sides ( a b c -- arr ) 3array ;

: valid? ( arr -- ? )
    dup [ 0 > ] all?
    [ sort first3 [ + ] dip > ] [ drop f ] if ;

: equilateral? ( a b c -- ? )
    sides dup valid? [ all-equal? ] [ drop f ] if ;

: isosceles? ( a b c -- ? )
    sides dup valid? [ duplicates length 0 > ] [ drop f ] if ;

: scalene? ( a b c -- ? )
    sides dup valid? [ all-unique? ] [ drop f ] if ;
