USING: accessors kernel locals math random sequences sorting ;
IN: dnd-character

TUPLE: character
    strength dexterity constitution intelligence wisdom charisma
    hitpoints ;

: modifier ( score -- n )
    2 /i 5 - ;

: roll-d6 ( -- n )
    6 random 1 + ;

! Roll four six-sided dice, drop the lowest, and sum the rest.
: ability ( -- score )
    4 [ roll-d6 ] replicate sort rest sum ;

:: <character> ( -- character )
    ability ability ability ability ability ability
    :> ( strength dexterity constitution intelligence wisdom charisma )
    strength dexterity constitution intelligence wisdom charisma
    constitution modifier 10 + character boa ;
