USING: accessors kernel math ;
IN: dragons-descendants

TUPLE: dragon name color age ;
: <dragon> ( name color age -- dragon )
    dragon boa ;

TUPLE: fire-dragon < dragon flame-temp ;
: <fire-dragon> ( name color age flame-temp -- fd )
    fire-dragon boa ;

TUPLE: ice-dragon < dragon chill-temp ;
: <ice-dragon> ( name color age chill-temp -- id )
    ice-dragon boa ;

TUPLE: volcano-dragon < fire-dragon lava-volume ;
: <volcano-dragon> ( name color age flame-temp lava-volume -- vd )
    volcano-dragon boa ;

: age-dragon ( dragon -- )
    [ 1 + ] change-age drop ;
