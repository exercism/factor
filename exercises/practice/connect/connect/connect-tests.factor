USING: connect exercism-tools io kernel tools.test unicode ;
IN: connect.tests

"an empty board has no winner" description
{ "" }
[ {
    ". . . . ."
    " . . . . ."
    "  . . . . ."
    "   . . . . ."
    "    . . . . ."
} winner ] unit-test

STOP-HERE

"X can win on a 1x1 board" description
{ "X" }
[ {
    "X"
} winner ] unit-test

"O can win on a 1x1 board" description
{ "O" }
[ {
    "O"
} winner ] unit-test

"only edges does not make a winner" description
{ "" }
[ {
    "O O O X"
    " X . . X"
    "  X . . X"
    "   X O O O"
} winner ] unit-test

"illegal diagonal does not make a winner" description
{ "" }
[ {
    "X O . ."
    " O X X X"
    "  O X O ."
    "   . O X ."
    "    X X O O"
} winner ] unit-test

"nobody wins crossing adjacent angles" description
{ "" }
[ {
    "X . . ."
    " . X O ."
    "  O . X O"
    "   . O . X"
    "    . . O ."
} winner ] unit-test

"X wins crossing from left to right" description
{ "X" }
[ {
    ". O . ."
    " O X X X"
    "  O X O ."
    "   X X O X"
    "    . O X ."
} winner ] unit-test

"X wins with left-hand dead end fork" description
{ "X" }
[ {
    ". . X ."
    " X X . ."
    "  . X X X"
    "   O O O O"
} winner ] unit-test

"X wins with right-hand dead end fork" description
{ "X" }
[ {
    ". . X X"
    " X X . ."
    "  . X X ."
    "   O O O O"
} winner ] unit-test

"O wins crossing from top to bottom" description
{ "O" }
[ {
    ". O . ."
    " O X X X"
    "  O O O ."
    "   X X O X"
    "    . O X ."
} winner ] unit-test

"X wins using a convoluted path" description
{ "X" }
[ {
    ". X X . ."
    " X . X . X"
    "  . X . X ."
    "   . X X . ."
    "    O O O O O"
} winner ] unit-test

"X wins using a spiral path" description
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
