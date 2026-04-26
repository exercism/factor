USING: kernel ;
IN: currency-conversion

: exchange-money ( budget exchange-rate -- exchanged )
    "unimplemented" throw ;

: get-change ( budget exchanging-value -- change )
    "unimplemented" throw ;

: value-of-bills ( denomination number-of-bills -- value )
    "unimplemented" throw ;

: number-of-bills ( amount denomination -- bills )
    "unimplemented" throw ;

: leftover-of-bills ( amount denomination -- leftover )
    "unimplemented" throw ;

: exchangeable-value ( budget exchange-rate spread denomination -- value )
    "unimplemented" throw ;
