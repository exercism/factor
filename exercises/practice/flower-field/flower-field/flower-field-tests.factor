USING: exercism-tools flower-field io kernel tools.test unicode ;
IN: flower-field.tests

"no rows" description
{ { } }
[ { } annotate ] unit-test

STOP-HERE

"no columns" description
{ { "" } }
[ { "" } annotate ] unit-test

"no flowers" description
{ {
    "   "
    "   "
    "   "
} }
[ {
    "   "
    "   "
    "   "
} annotate ] unit-test

"garden full of flowers" description
{ {
    "***"
    "***"
    "***"
} }
[ {
    "***"
    "***"
    "***"
} annotate ] unit-test

"flower surrounded by spaces" description
{ {
    "111"
    "1*1"
    "111"
} }
[ {
    "   "
    " * "
    "   "
} annotate ] unit-test

"space surrounded by flowers" description
{ {
    "***"
    "*8*"
    "***"
} }
[ {
    "***"
    "* *"
    "***"
} annotate ] unit-test

"horizontal line" description
{ { "1*2*1" } }
[ { " * * " } annotate ] unit-test

"horizontal line, flowers at edges" description
{ { "*1 1*" } }
[ { "*   *" } annotate ] unit-test

"vertical line" description
{ {
    "1"
    "*"
    "2"
    "*"
    "1"
} }
[ {
    " "
    "*"
    " "
    "*"
    " "
} annotate ] unit-test

"vertical line, flowers at edges" description
{ {
    "*"
    "1"
    " "
    "1"
    "*"
} }
[ {
    "*"
    " "
    " "
    " "
    "*"
} annotate ] unit-test

"cross" description
{ {
    " 2*2 "
    "25*52"
    "*****"
    "25*52"
    " 2*2 "
} }
[ {
    "  *  "
    "  *  "
    "*****"
    "  *  "
    "  *  "
} annotate ] unit-test

"large garden" description
{ {
    "1*22*1"
    "12*322"
    " 123*2"
    "112*4*"
    "1*22*2"
    "111111"
} }
[ {
    " *  * "
    "  *   "
    "    * "
    "   * *"
    " *  * "
    "      "
} annotate ] unit-test

"multiple adjacent flowers" description
{ { "1**1" } }
[ { " ** " } annotate ] unit-test
