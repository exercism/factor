USING: arrays formatting fry kernel math sequences ;
IN: furlong-finish

: assign-bibs ( names -- pairs )
    [ swap 2array ] map-index ;

: lane-labels ( names -- labels )
    [ swap "Lane %d: %s" sprintf ] map-index ;

: tag-runners ( names tag -- tagged )
    [ spin "%s/%d: %s" sprintf ] curry map-index ;

: record-finishes ( names ledger -- )
    '[ swap "%d: %s" sprintf _ push ] each-index ;

: hoofbeats ( clops -- str )
    "" swap [ "clop " append ] times ;
