USING: io kernel lexer rectangles tools.test unicode ;
IN: rectangles.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Rectangles:" print

"no rows" print
{ 0 }
[ { } count-rectangles ] unit-test

STOP-HERE

"no columns" print
{ 0 }
[ {
    ""
} count-rectangles ] unit-test

"no rectangles" print
{ 0 }
[ {
    " "
} count-rectangles ] unit-test

"one rectangle" print
{ 1 }
[ {
    "+-+"
    "| |"
    "+-+"
} count-rectangles ] unit-test

"two rectangles without shared parts" print
{ 2 }
[ {
    "  +-+"
    "  | |"
    "+-+-+"
    "| |  "
    "+-+  "
} count-rectangles ] unit-test

"five rectangles with shared parts" print
{ 5 }
[ {
    "  +-+"
    "  | |"
    "+-+-+"
    "| | |"
    "+-+-+"
} count-rectangles ] unit-test

"rectangle of height 1 is counted" print
{ 1 }
[ {
    "+--+"
    "+--+"
} count-rectangles ] unit-test

"rectangle of width 1 is counted" print
{ 1 }
[ {
    "++"
    "||"
    "++"
} count-rectangles ] unit-test

"1x1 square is counted" print
{ 1 }
[ {
    "++"
    "++"
} count-rectangles ] unit-test

"only complete rectangles are counted" print
{ 1 }
[ {
    "  +-+"
    "    |"
    "+-+-+"
    "| | -"
    "+-+-+"
} count-rectangles ] unit-test

"rectangles can be of different sizes" print
{ 3 }
[ {
    "+------+----+"
    "|      |    |"
    "+---+--+    |"
    "|   |       |"
    "+---+-------+"
} count-rectangles ] unit-test

"corner is required for a rectangle to be complete" print
{ 2 }
[ {
    "+------+----+"
    "|      |    |"
    "+------+    |"
    "|   |       |"
    "+---+-------+"
} count-rectangles ] unit-test

"large input with many rectangles" print
{ 60 }
[ {
    "+---+--+----+"
    "|   +--+----+"
    "+---+--+    |"
    "|   +--+----+"
    "+---+--+--+-+"
    "+---+--+--+-+"
    "+------+  | |"
    "          +-+"
} count-rectangles ] unit-test

"rectangles must have four sides" print
{ 5 }
[ {
    "+-+ +-+"
    "| | | |"
    "+-+-+-+"
    "  | |  "
    "+-+-+-+"
    "| | | |"
    "+-+ +-+"
} count-rectangles ] unit-test

"very large input" print
{ 2063 }
[ {
    "      +-----+--------+    +-----+ "
    "++---++-----+--------+---++-----++"
    "||+--++-----+-+-++   |   ||     ||"
    "|||  ||     +-+-++-+ |   ||     ||"
    "|||  ||     | | || | |   ||     ||"
    "||| +++-----+-+-++-+-+---++-+   ||"
    "||| |||     | | || | |+--++-+-+ ||"
    "||| +++---+-+-+-++-+-++--++-+ | ||"
    "||| |||+--+-+-+-+| | |+--++---+ ||"
    "||| ||||  | | | || | |+-+||     ||"
    "||+-++++--+-+++-++-+-++-+++---++||"
    "||  |+++--+-+++-+--+-+| |||   ||||"
    "+++-+++++---++--+-++-++-+++---+|||"
    " |+-+++++---++--+ || || |||   ||||"
    " |  +++++---++--+-++-++-++++  ||||"
    " |   ||||   |+----++-++-++++--+++|"
    " |   |+++---+|    || || ||    || |"
    "+++  |||+---++----+| || ||    || |"
    "|||  +++----++----++-++-++----++-+"
    "+++---++----++-----+-++-++----++  "
    "                      +-+         "
} count-rectangles ] unit-test
