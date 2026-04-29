USING: assocs kernel locals math math.functions math.order sequences vectors ;
IN: armstrong-numbers

:: digits ( x -- digits )
    x 10 /mod :> x! :> xs!
    V{ } clone :> digits
    x digits push

    [ xs 0 = not ]
    [
        xs 10 /mod x! xs!
        x digits push
    ] while

    digits reverse ;

:: powsum ( x -- powsum )
    x digits :> digs
    digs length :> len

    digs [ len ^ ] map sum ;

: armstrong? ( n -- ? )
    [ ] [ powsum ] bi = ;
