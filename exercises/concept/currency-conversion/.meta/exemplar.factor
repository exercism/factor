USING: kernel locals math math.functions ;
IN: currency-conversion

: exchange-money ( budget exchange-rate -- exchanged )
    / ;

: get-change ( budget exchanging-value -- change )
    - ;

: value-of-bills ( denomination number-of-bills -- value )
    * ;

: number-of-bills ( amount denomination -- bills )
    [ floor >integer ] dip /i ;

: leftover-of-bills ( amount denomination -- leftover )
    mod ;

:: exchangeable-value ( budget exchange-rate spread denomination -- value )
    budget
    exchange-rate exchange-rate 100 / spread * +
    exchange-money
    denomination number-of-bills
    denomination swap value-of-bills ;
