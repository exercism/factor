USING: accessors fry kernel math math.order ;
IN: role-playing-game

TUPLE: player
    { name initial: f }
    { level initial: 0 }
    { health initial: 100 }
    { mana initial: f } ;

: introduce ( player -- string )
    name>> [ "Mighty Magician" ] unless* ;

: revive ( player -- player' )
    dup health>> zero?
    [ clone 100 >>health 100 >>mana ]
    [ drop f ] if ;

: take-damage ( player damage -- player' )
    [ clone ] dip '[ _ - 0 max ] change-health ;
