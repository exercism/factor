USING: formatting kernel math math.parser splitting ;
IN: clock

: normalize ( minutes -- minutes' )
    1440 mod dup 0 < [ 1440 + ] when ;

: minutes>clock ( minutes -- str )
    normalize 60 /mod "%02d:%02d" sprintf ;

: <clock> ( hour minute -- str )
    swap 60 * + minutes>clock ;

: clock>minutes ( clock -- minutes )
    ":" split1 [ string>number ] bi@ swap 60 * + ;

: add-minutes ( clock minutes -- clock' )
    [ clock>minutes ] dip + minutes>clock ;

: subtract-minutes ( clock minutes -- clock' )
    neg add-minutes ;

: clock= ( clock1 clock2 -- ? ) = ;
