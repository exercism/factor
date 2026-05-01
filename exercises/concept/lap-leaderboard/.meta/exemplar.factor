USING: arrays formatting fry kernel math sequences ;
IN: lap-leaderboard

: assign-bibs ( names -- pairs )
    [ swap 2array ] map-index ;

: lane-labels ( names -- labels )
    [ swap "Lane %d: %s" sprintf ] map-index ;

: tag-racers ( names tag -- tagged )
    [ spin "%s/%d: %s" sprintf ] curry map-index ;

: record-finishes ( names ledger -- )
    '[ swap "%d: %s" sprintf _ push ] each-index ;

: lap-bells ( laps -- str )
    "" swap [ "ding " append ] times ;
