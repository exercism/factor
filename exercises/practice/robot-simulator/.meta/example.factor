USING: accessors combinators kernel math sequences ;
IN: robot-simulator

SYMBOLS: north east south west ;

TUPLE: robot x y direction ;

: <robot> ( x y direction -- robot ) robot boa ;

: turn-right ( direction -- direction' )
    {
        { north [ east  ] }
        { east  [ south ] }
        { south [ west  ] }
        { west  [ north ] }
    } case ;

: turn-left ( direction -- direction' )
    {
        { north [ west  ] }
        { east  [ north ] }
        { south [ east  ] }
        { west  [ south ] }
    } case ;

: advance ( robot -- robot )
    dup direction>> {
        { north [ [ 1 + ] change-y ] }
        { east  [ [ 1 + ] change-x ] }
        { south [ [ 1 - ] change-y ] }
        { west  [ [ 1 - ] change-x ] }
    } case ;

: step ( robot char -- robot )
    {
        { CHAR: R [ [ turn-right ] change-direction ] }
        { CHAR: L [ [ turn-left  ] change-direction ] }
        { CHAR: A [ advance ] }
    } case ;

: move ( robot instructions -- robot )
    [ step ] each ;
