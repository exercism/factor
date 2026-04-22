USING: arrays kernel locals math sequences vectors ;
IN: prime-factors

:: factors ( n -- factors )
    V{ } clone :> result
    n :> remaining!
    2 :> divisor!
    [ remaining 1 > ] [
        remaining divisor mod 0 = [
            divisor result push
            remaining divisor /i remaining!
        ] [
            divisor 1 + divisor!
        ] if
    ] while
    result >array ;
