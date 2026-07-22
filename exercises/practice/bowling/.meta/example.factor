USING: accessors combinators kernel locals math sequences ;
IN: bowling

TUPLE: game rolls current frame ;

: <game> ( -- game )
    V{ } clone V{ } clone 1 game boa ;

! Pins standing for the next roll, or f when the game is over.
:: tenth-standing ( cur -- pins )
    {
        { [ cur length 0 = ] [ 10 ] }
        { [ cur length 1 = ] [ cur first 10 = [ 10 ] [ 10 cur first - ] if ] }
        { [ cur length 2 = ] [
            cur first 10 =
            [ cur second 10 = [ 10 ] [ 10 cur second - ] if ]
            [ cur sum 10 = [ 10 ] [ f ] if ] if
        ] }
        [ f ]
    } cond ;

:: standing ( game -- pins )
    game current>> :> cur
    game frame>> 10 <
    [ cur empty? [ 10 ] [ 10 cur first - ] if ]
    [ cur tenth-standing ] if ;

: frame-done? ( game -- ? )
    current>> [ first 10 = ] [ length 2 = ] bi or ;

:: roll ( pins game -- )
    pins 0 < [ "Negative roll is invalid" throw ] when
    game standing :> available
    available [ "Cannot roll after game is over" throw ] unless
    pins available > [ "Pin count exceeds pins on the lane" throw ] when
    pins game rolls>> push
    pins game current>> push
    game frame>> 10 < game frame-done? and
    [ game [ 1 + ] change-frame V{ } clone >>current drop ] when ;

:: score ( game -- n )
    game standing [ "Score cannot be taken until the end of the game" throw ] when
    game rolls>> :> rolls
    0 :> total!
    0 :> i!
    10 [
        i rolls nth :> first-roll
        first-roll 10 =
        [
            total 10 + i 1 + rolls nth + i 2 + rolls nth + total!
            i 1 + i!
        ]
        [
            i 1 + rolls nth :> second-roll
            first-roll second-roll + 10 =
            [ total 10 + i 2 + rolls nth + total! ]
            [ total first-roll + second-roll + total! ] if
            i 2 + i!
        ] if
    ] times
    total ;
