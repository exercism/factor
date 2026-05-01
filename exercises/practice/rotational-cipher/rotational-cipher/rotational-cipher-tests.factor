USING: exercism-tools io kernel rotational-cipher tools.test unicode ;
IN: rotational-cipher.tests

"Rotational Cipher:" print

"rotate a by 0, same output as input" print
{ "a" }
[ "a" 0 rotate ] unit-test

STOP-HERE

"rotate a by 1" print
{ "b" }
[ "a" 1 rotate ] unit-test

"rotate a by 26, same output as input" print
{ "a" }
[ "a" 26 rotate ] unit-test

"rotate m by 13" print
{ "z" }
[ "m" 13 rotate ] unit-test

"rotate n by 13 with wrap around alphabet" print
{ "a" }
[ "n" 13 rotate ] unit-test

"rotate capital letters" print
{ "TRL" }
[ "OMG" 5 rotate ] unit-test

"rotate spaces" print
{ "T R L" }
[ "O M G" 5 rotate ] unit-test

"rotate numbers" print
{ "Xiwxmrk 1 2 3 xiwxmrk" }
[ "Testing 1 2 3 testing" 4 rotate ] unit-test

"rotate punctuation" print
{ "Gzo'n zvo, Bmviyhv!" }
[ "Let's eat, Grandma!" 21 rotate ] unit-test

"rotate all letters" print
{ "Gur dhvpx oebja sbk whzcf bire gur ynml qbt." }
[ "The quick brown fox jumps over the lazy dog." 13 rotate ] unit-test

"rotate boundary characters" print
{ "/09:@NZAM[`nzam{" }
[ "/09:@AMNZ[`amnz{" 13 rotate ] unit-test
