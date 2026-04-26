USING: kernel math math.bitwise ;
IN: secrets

: shift-back ( value amount -- result )
    [ 32 bits ] dip neg shift ;

: set-bits ( value mask -- result )
    bitor ;

: flip-bits ( value mask -- result )
    bitxor ;

: clear-bits ( value mask -- result )
    bitnot bitand ;
