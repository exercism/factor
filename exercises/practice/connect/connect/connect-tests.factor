USING: connect io kernel lexer tools.test unicode ;
IN: connect.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Connect:" print

"an empty board has no winner" print
{ "" }
[ {
    ". . . . ."
    " . . . . ."
    "  . . . . ."
    "   . . . . ."
    "    . . . . ."
} winner ] unit-test

STOP-HERE

"X can win on a 1x1 board" print
{ "X" }
[ {
    "X"
} winner ] unit-test

"O can win on a 1x1 board" print
{ "O" }
[ {
    "O"
} winner ] unit-test

"only edges does not make a winner" print
{ "" }
[ {
    "O O O X"
    " X . . X"
    "  X . . X"
    "   X O O O"
} winner ] unit-test

"illegal diagonal does not make a winner" print
{ "" }
[ {
    "X O . ."
    " O X X X"
    "  O X O ."
    "   . O X ."
    "    X X O O"
} winner ] unit-test

"nobody wins crossing adjacent angles" print
{ "" }
[ {
    "X . . ."
    " . X O ."
    "  O . X O"
    "   . O . X"
    "    . . O ."
} winner ] unit-test

"X wins crossing from left to right" print
{ "X" }
[ {
    ". O . ."
    " O X X X"
    "  O X O ."
    "   X X O X"
    "    . O X ."
} winner ] unit-test

"X wins with left-hand dead end fork" print
{ "X" }
[ {
    ". . X ."
    " X X . ."
    "  . X X X"
    "   O O O O"
} winner ] unit-test

"X wins with right-hand dead end fork" print
{ "X" }
[ {
    ". . X X"
    " X X . ."
    "  . X X ."
    "   O O O O"
} winner ] unit-test

"O wins crossing from top to bottom" print
{ "O" }
[ {
    ". O . ."
    " O X X X"
    "  O O O ."
    "   X X O X"
    "    . O X ."
} winner ] unit-test

"X wins using a convoluted path" print
{ "X" }
[ {
    ". X X . ."
    " X . X . X"
    "  . X . X ."
    "   . X X . ."
    "    O O O O O"
} winner ] unit-test

"X wins using a spiral path" print
{ "X" }
[ {
    "O X X X X X X X X"
    " O X O O O O O O O"
    "  O X O X X X X X O"
    "   O X O X O O O X O"
    "    O X O X X X O X O"
    "     O X O O O X O X O"
    "      O X X X X X O X O"
    "       O O O O O O O X O"
    "        X X X X X X X X O"
} winner ] unit-test
