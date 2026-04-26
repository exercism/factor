USING: kernel ;
IN: role-playing-game

! TASK 1: Define the player tuple with slots
!     name (default f), level (default 0),
!     health (default 100), mana (default f).
TUPLE: player ;

: introduce ( player -- string )
    "unimplemented" throw ;

: revive ( player -- player' )
    "unimplemented" throw ;

: take-damage ( player damage -- player' )
    "unimplemented" throw ;
