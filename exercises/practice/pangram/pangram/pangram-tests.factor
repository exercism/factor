USING: io kernel lexer pangram tools.test unicode ;
IN: pangram.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Pangram:" print

"empty sentence" print
{ f } [ "" pangram? ] unit-test

STOP-HERE

"perfect lower case" print
{ t } [ "abcdefghijklmnopqrstuvwxyz" pangram? ] unit-test

"only lower case" print
{ t } [ "the quick brown fox jumps over the lazy dog" pangram? ] unit-test

"missing the letter 'x'" print
{ f } [ "a quick movement of the enemy will jeopardize five gunboats" pangram? ] unit-test

"missing the letter 'h'" print
{ f } [ "five boxing wizards jump quickly at it" pangram? ] unit-test

"with underscores" print
{ t } [ "the_quick_brown_fox_jumps_over_the_lazy_dog" pangram? ] unit-test

"with numbers" print
{ t } [ "the 1 quick brown fox jumps over the 2 lazy dogs" pangram? ] unit-test

"missing letters replaced by numbers" print
{ f } [ "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog" pangram? ] unit-test

"mixed case and punctuation" print
{ t } [ "\"Five quacking Zephyrs jolt my wax bed.\"" pangram? ] unit-test

"a-m and A-M are 26 different characters but not a pangram" print
{ f } [ "abcdefghijklm ABCDEFGHIJKLM" pangram? ] unit-test
