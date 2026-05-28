USING: exercism-tools io kernel pangram tools.test unicode ;
IN: pangram.tests

"empty sentence" description
{ f }
[ "" pangram? ] unit-test

STOP-HERE

"perfect lower case" description
{ t }
[ "abcdefghijklmnopqrstuvwxyz" pangram? ] unit-test

"only lower case" description
{ t }
[ "the quick brown fox jumps over the lazy dog" pangram? ] unit-test

"missing the letter 'x'" description
{ f }
[ "a quick movement of the enemy will jeopardize five gunboats" pangram? ] unit-test

"missing the letter 'h'" description
{ f }
[ "five boxing wizards jump quickly at it" pangram? ] unit-test

"with underscores" description
{ t }
[ "the_quick_brown_fox_jumps_over_the_lazy_dog" pangram? ] unit-test

"with numbers" description
{ t }
[ "the 1 quick brown fox jumps over the 2 lazy dogs" pangram? ] unit-test

"missing letters replaced by numbers" description
{ f }
[ "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog" pangram? ] unit-test

"mixed case and punctuation" description
{ t }
[ "\"Five quacking Zephyrs jolt my wax bed.\"" pangram? ] unit-test

"a-m and A-M are 26 different characters but not a pangram" description
{ f }
[ "abcdefghijklm ABCDEFGHIJKLM" pangram? ] unit-test
