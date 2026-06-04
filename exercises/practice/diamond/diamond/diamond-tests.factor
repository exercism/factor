USING: diamond exercism-tools io kernel tools.test unicode ;
IN: diamond.tests

"Degenerate case with a single 'A' row" description
{ { "A" } }
[ CHAR: A rows ] unit-test

STOP-HERE

"Degenerate case with no row containing 3 distinct groups of spaces" description
{
    {
        " A "
        "B B"
        " A "
    }
} [ CHAR: B rows ] unit-test

"Smallest non-degenerate case with odd diamond side length" description
{
    {
        "  A  "
        " B B "
        "C   C"
        " B B "
        "  A  "
    }
} [ CHAR: C rows ] unit-test

"Smallest non-degenerate case with even diamond side length" description
{
    {
        "   A   "
        "  B B  "
        " C   C "
        "D     D"
        " C   C "
        "  B B  "
        "   A   "
    }
} [ CHAR: D rows ] unit-test

"Largest possible diamond" description
{
    {
        "                         A                         "
        "                        B B                        "
        "                       C   C                       "
        "                      D     D                      "
        "                     E       E                     "
        "                    F         F                    "
        "                   G           G                   "
        "                  H             H                  "
        "                 I               I                 "
        "                J                 J                "
        "               K                   K               "
        "              L                     L              "
        "             M                       M             "
        "            N                         N            "
        "           O                           O           "
        "          P                             P          "
        "         Q                               Q         "
        "        R                                 R        "
        "       S                                   S       "
        "      T                                     T      "
        "     U                                       U     "
        "    V                                         V    "
        "   W                                           W   "
        "  X                                             X  "
        " Y                                               Y "
        "Z                                                 Z"
        " Y                                               Y "
        "  X                                             X  "
        "   W                                           W   "
        "    V                                         V    "
        "     U                                       U     "
        "      T                                     T      "
        "       S                                   S       "
        "        R                                 R        "
        "         Q                               Q         "
        "          P                             P          "
        "           O                           O           "
        "            N                         N            "
        "             M                       M             "
        "              L                     L              "
        "               K                   K               "
        "                J                 J                "
        "                 I               I                 "
        "                  H             H                  "
        "                   G           G                   "
        "                    F         F                    "
        "                     E       E                     "
        "                      D     D                      "
        "                       C   C                       "
        "                        B B                        "
        "                         A                         "
    }
} [ CHAR: Z rows ] unit-test
