USING: kernel math math.parser math.statistics sequences sorting ;
IN: boutique-bookkeeping

: sort-by-price ( inventory -- sorted )
    [ second ] sort-by ;

: with-missing-price ( inventory -- filtered )
    [ second ] reject ;

: expensive-items ( inventory -- count )
    [ second 50 > ] count ;

: cheapest-item ( inventory -- item )
    [ second ] infimum-by ;

: total-price ( inventory -- sum )
    [ second ] map-sum ;

: format-price-tag ( item -- str )
    first2 number>string
    [ ": $" append ] dip append ;
