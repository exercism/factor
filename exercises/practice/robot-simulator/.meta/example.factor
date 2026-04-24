USING: arrays combinators kernel locals math sequences ;
IN: robot-simulator

: <robot> ( x y dir -- robot ) 3array ;

: turn ( robot offset -- robot )
    [ dup third { "north" "east" "south" "west" } index ] dip
    + 4 + 4 mod { "north" "east" "south" "west" } nth
    [ but-last ] dip suffix ;

:: advance ( robot -- robot )
    robot first3 :> ( x y dir )
    dir {
        { "north" [ x y 1 + ] }
        { "east"  [ x 1 + y ] }
        { "south" [ x y 1 - ] }
        { "west"  [ x 1 - y ] }
    } case dir <robot> ;

: step ( robot char -- robot )
    { { CHAR: R [ 1 turn ] }
      { CHAR: L [ -1 turn ] }
      { CHAR: A [ advance ] } } case ;

: move ( robot instructions -- robot )
    [ step ] each ;
