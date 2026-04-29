USING: accessors arrays combinators kernel math sequences sets sorting ;
IN: triangle

TUPLE: triangle a b c ;

: <triangle> ( a b c -- triangle ) triangle boa ;

: sides ( triangle -- arr )
    [ a>> ] [ b>> ] [ c>> ] tri 3array ;

: valid? ( triangle -- ? )
    sides dup [ 0 > ] all?
    [ sort first3 [ + ] dip > ] [ drop f ] if ;

: equilateral? ( triangle -- ? )
    dup valid? [ sides members length 1 = ] [ drop f ] if ;

: isosceles? ( triangle -- ? )
    dup valid? [ sides members length 3 < ] [ drop f ] if ;

: scalene? ( triangle -- ? )
    dup valid? [ sides all-unique? ] [ drop f ] if ;
