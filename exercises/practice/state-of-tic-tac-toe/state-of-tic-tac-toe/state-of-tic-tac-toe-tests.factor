USING: exercism-tools io kernel state-of-tic-tac-toe tools.test unicode ;
IN: state-of-tic-tac-toe.tests

"Finished game where X won via left column victory" description
{ "win" }
[ {
    "XOO"
    "X  "
    "X  "
} gamestate ] unit-test

STOP-HERE

"Finished game where X won via middle column victory" description
{ "win" }
[ {
    "OXO"
    " X "
    " X "
} gamestate ] unit-test

"Finished game where X won via right column victory" description
{ "win" }
[ {
    "OOX"
    "  X"
    "  X"
} gamestate ] unit-test

"Finished game where O won via left column victory" description
{ "win" }
[ {
    "OXX"
    "OX "
    "O  "
} gamestate ] unit-test

"Finished game where O won via middle column victory" description
{ "win" }
[ {
    "XOX"
    " OX"
    " O "
} gamestate ] unit-test

"Finished game where O won via right column victory" description
{ "win" }
[ {
    "XXO"
    " XO"
    "  O"
} gamestate ] unit-test

"Finished game where X won via top row victory" description
{ "win" }
[ {
    "XXX"
    "XOO"
    "O  "
} gamestate ] unit-test

"Finished game where X won via middle row victory" description
{ "win" }
[ {
    "O  "
    "XXX"
    " O "
} gamestate ] unit-test

"Finished game where X won via bottom row victory" description
{ "win" }
[ {
    " OO"
    "O X"
    "XXX"
} gamestate ] unit-test

"Finished game where O won via top row victory" description
{ "win" }
[ {
    "OOO"
    "XXO"
    "XX "
} gamestate ] unit-test

"Finished game where O won via middle row victory" description
{ "win" }
[ {
    "XX "
    "OOO"
    "X  "
} gamestate ] unit-test

"Finished game where O won via bottom row victory" description
{ "win" }
[ {
    "XOX"
    " XX"
    "OOO"
} gamestate ] unit-test

"Finished game where X won via falling diagonal victory" description
{ "win" }
[ {
    "XOO"
    " X "
    "  X"
} gamestate ] unit-test

"Finished game where X won via rising diagonal victory" description
{ "win" }
[ {
    "O X"
    "OX "
    "X  "
} gamestate ] unit-test

"Finished game where O won via falling diagonal victory" description
{ "win" }
[ {
    "OXX"
    "OOX"
    "X O"
} gamestate ] unit-test

"Finished game where O won via rising diagonal victory" description
{ "win" }
[ {
    "  O"
    " OX"
    "OXX"
} gamestate ] unit-test

"Finished game where X won via a row and a column victory" description
{ "win" }
[ {
    "XXX"
    "XOO"
    "XOO"
} gamestate ] unit-test

"Finished game where X won via two diagonal victories" description
{ "win" }
[ {
    "XOX"
    "OXO"
    "XOX"
} gamestate ] unit-test

"Draw" description
{ "draw" }
[ {
    "XOX"
    "XXO"
    "OXO"
} gamestate ] unit-test

"Another draw" description
{ "draw" }
[ {
    "XXO"
    "OXX"
    "XOO"
} gamestate ] unit-test

"Ongoing game: one move in" description
{ "ongoing" }
[ {
    "   "
    "X  "
    "   "
} gamestate ] unit-test

"Ongoing game: two moves in" description
{ "ongoing" }
[ {
    "O  "
    " X "
    "   "
} gamestate ] unit-test

"Ongoing game: five moves in" description
{ "ongoing" }
[ {
    "X  "
    " XO"
    "OX "
} gamestate ] unit-test

"Invalid board: X went twice" description
[ {
    "XX "
    "   "
    "   "
} gamestate ]
[ "Wrong turn order: X went twice" = ] must-fail-with

"Invalid board: O started" description
[ {
    "OOX"
    "   "
    "   "
} gamestate ]
[ "Wrong turn order: O started" = ] must-fail-with

"Invalid board: X won and O kept playing" description
[ {
    "XXX"
    "OOO"
    "   "
} gamestate ]
[ "Impossible board: game should have ended after the game was won" = ] must-fail-with

"Invalid board: players kept playing after a win" description
[ {
    "XXX"
    "OOO"
    "XOX"
} gamestate ]
[ "Impossible board: game should have ended after the game was won" = ] must-fail-with

"Invalid board: O kept playing after X wins" description
[ {
    "OO "
    "XXX"
    " O "
} gamestate ]
[ "Impossible board: game should have ended after the game was won" = ] must-fail-with

"Invalid board: X kept playing after O wins" description
[ {
    "XX "
    "OOO"
    " XX"
} gamestate ]
[ "Impossible board: game should have ended after the game was won" = ] must-fail-with
