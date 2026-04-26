USING: kernel ;
IN: character-study

SYMBOLS: less equal greater
    big small no-size
    alpha numeric space newline unknown ;

: compare-chars ( c1 c2 -- symbol )
    "unimplemented" throw ;

: size-of-char ( c -- symbol )
    "unimplemented" throw ;

: change-size-of-char ( c desired -- c' )
    "unimplemented" throw ;

: type-of-char ( c -- symbol )
    "unimplemented" throw ;
