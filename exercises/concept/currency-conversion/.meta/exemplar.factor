USING: kernel math math.functions math.order ;
IN: currency-conversion

: exchange-money ( budget exchange-rate -- exchanged )
    / ;

: get-change ( budget exchanging-value -- change )
    - ;

: value-of-bills ( denomination number-of-bills -- value )
    * ;

: number-of-bills ( amount denomination -- bills )
    swap floor >integer swap /i ;

: leftover-of-bills ( amount denomination -- leftover )
    mod ;

: exchangeable-value ( denomination budget spread exchange-rate -- value )
    swap 100 + * 100 / / over number-of-bills * ;

: safe-change ( budget exchanging-value -- change )
    - 0 max ;

: cap-spend ( budget price -- spend )
    min ;
