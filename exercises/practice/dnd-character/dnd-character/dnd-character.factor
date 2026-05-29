USING: kernel ;
IN: dnd-character

TUPLE: character
    strength dexterity constitution intelligence wisdom charisma
    hitpoints ;

: modifier ( score -- n )
    "unimplemented" throw ;

: ability ( -- score )
    "unimplemented" throw ;

: <character> ( -- character )
    "unimplemented" throw ;
