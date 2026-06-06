USING: accessors kernel locals math ;
IN: queen-attack

ERROR: row-not-on-board ;
ERROR: column-not-on-board ;

TUPLE: queen row column ;

:: <queen> ( row column -- queen )
    row 0 < row 7 > or [ row-not-on-board ] when
    column 0 < column 7 > or [ column-not-on-board ] when
    row column queen boa ;

:: can-attack? ( queen1 queen2 -- ? )
    queen1 row>> queen2 row>> - :> drow
    queen1 column>> queen2 column>> - :> dcol
    drow 0 = dcol 0 = drow abs dcol abs = or or ;
