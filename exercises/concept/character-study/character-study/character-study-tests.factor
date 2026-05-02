USING: character-study exercism-tools tools.test ;
IN: character-study.tests

TASK: 1 compare-chars
{ less } [ CHAR: A CHAR: B compare-chars ] unit-test

STOP-HERE

{ greater } [ CHAR: B CHAR: A compare-chars ] unit-test
{ equal } [ CHAR: A CHAR: A compare-chars ] unit-test
{ less } [ CHAR: A CHAR: a compare-chars ] unit-test
{ greater } [ CHAR: z CHAR: A compare-chars ] unit-test

TASK: 2 size-of-char
{ big } [ CHAR: A size-of-char ] unit-test
{ big } [ CHAR: Z size-of-char ] unit-test
{ small } [ CHAR: a size-of-char ] unit-test
{ small } [ CHAR: z size-of-char ] unit-test
{ no-size } [ CHAR: 5 size-of-char ] unit-test
{ no-size } [ CHAR: space size-of-char ] unit-test
{ no-size } [ CHAR: ! size-of-char ] unit-test

TASK: 3 change-size-of-char
{ CHAR: A } [ CHAR: a big change-size-of-char ] unit-test
{ CHAR: Z } [ CHAR: z big change-size-of-char ] unit-test
{ CHAR: a } [ CHAR: A small change-size-of-char ] unit-test
{ CHAR: z } [ CHAR: Z small change-size-of-char ] unit-test

TASK: 4 type-of-char
{ alpha } [ CHAR: A type-of-char ] unit-test
{ alpha } [ CHAR: a type-of-char ] unit-test
{ alpha } [ CHAR: z type-of-char ] unit-test
{ numeric } [ CHAR: 5 type-of-char ] unit-test
{ numeric } [ CHAR: 0 type-of-char ] unit-test
{ space } [ CHAR: space type-of-char ] unit-test
{ newline } [ CHAR: \n type-of-char ] unit-test
{ unknown } [ CHAR: ! type-of-char ] unit-test
{ unknown } [ CHAR: ? type-of-char ] unit-test
