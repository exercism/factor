USING: accessors kernel locals math ;
IN: queen-attack

TUPLE: queen row column ;

:: <queen> ( row column -- queen )
    row 0 < [ "row not positive" throw ] when
    row 7 > [ "row not on board" throw ] when
    column 0 < [ "column not positive" throw ] when
    column 7 > [ "column not on board" throw ] when
    row column queen boa ;

:: can-attack? ( queen1 queen2 -- ? )
    queen1 row>> queen2 row>> - :> drow
    queen1 column>> queen2 column>> - :> dcol
    drow 0 = dcol 0 = drow abs dcol abs = or or ;
