USING: kernel locals math sequences ;
IN: state-of-tic-tac-toe

CONSTANT: winning-lines {
    { 0 1 2 } { 3 4 5 } { 6 7 8 }
    { 0 3 6 } { 1 4 7 } { 2 5 8 }
    { 0 4 8 } { 2 4 6 }
}

:: won? ( cells ch -- ? )
    winning-lines [ [ cells nth ch = ] all? ] any? ;

:: gamestate ( board -- state )
    board concat :> cells
    cells [ CHAR: X = ] count :> xs
    cells [ CHAR: O = ] count :> os
    cells CHAR: X won? :> x-won
    cells CHAR: O won? :> o-won

    xs os 1 + > [ "Wrong turn order: X went twice" throw ] when
    os xs > [ "Wrong turn order: O started" throw ] when
    x-won xs os = and o-won xs os > and or
    [ "Impossible board: game should have ended after the game was won" throw ] when

    x-won o-won or
    [ "win" ]
    [ cells [ CHAR: \s = ] any? [ "ongoing" ] [ "draw" ] if ] if ;
