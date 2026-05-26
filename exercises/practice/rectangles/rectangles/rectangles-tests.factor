USING: exercism-tools io kernel rectangles tools.test unicode ;
IN: rectangles.tests

"no rows" description
{ 0 }
[ { } count-rectangles ] unit-test

STOP-HERE

"no columns" description
{ 0 }
[ {
    ""
} count-rectangles ] unit-test

"no rectangles" description
{ 0 }
[ {
    " "
} count-rectangles ] unit-test

"one rectangle" description
{ 1 }
[ {
    "+-+"
    "| |"
    "+-+"
} count-rectangles ] unit-test

"two rectangles without shared parts" description
{ 2 }
[ {
    "  +-+"
    "  | |"
    "+-+-+"
    "| |  "
    "+-+  "
} count-rectangles ] unit-test

"five rectangles with shared parts" description
{ 5 }
[ {
    "  +-+"
    "  | |"
    "+-+-+"
    "| | |"
    "+-+-+"
} count-rectangles ] unit-test

"rectangle of height 1 is counted" description
{ 1 }
[ {
    "+--+"
    "+--+"
} count-rectangles ] unit-test

"rectangle of width 1 is counted" description
{ 1 }
[ {
    "++"
    "||"
    "++"
} count-rectangles ] unit-test

"1x1 square is counted" description
{ 1 }
[ {
    "++"
    "++"
} count-rectangles ] unit-test

"only complete rectangles are counted" description
{ 1 }
[ {
    "  +-+"
    "    |"
    "+-+-+"
    "| | -"
    "+-+-+"
} count-rectangles ] unit-test

"rectangles can be of different sizes" description
{ 3 }
[ {
    "+------+----+"
    "|      |    |"
    "+---+--+    |"
    "|   |       |"
    "+---+-------+"
} count-rectangles ] unit-test

"corner is required for a rectangle to be complete" description
{ 2 }
[ {
    "+------+----+"
    "|      |    |"
    "+------+    |"
    "|   |       |"
    "+---+-------+"
} count-rectangles ] unit-test

"large input with many rectangles" description
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

"rectangles must have four sides" description
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

"very large input" description
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
