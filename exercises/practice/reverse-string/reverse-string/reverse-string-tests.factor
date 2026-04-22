USING: io kernel lexer reverse-string tools.test unicode ;
IN: reverse-string.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Reverse String:" print

"an empty string" print
{ "" } [ "" reverse-string ] unit-test

STOP-HERE

"a word" print
{ "tobor" } [ "robot" reverse-string ] unit-test

"a capitalized word" print
{ "nemaR" } [ "Ramen" reverse-string ] unit-test

"a sentence with punctuation" print
{ "!yrgnuh m'I" } [ "I'm hungry!" reverse-string ] unit-test

"a palindrome" print
{ "racecar" } [ "racecar" reverse-string ] unit-test

"an even-sized word" print
{ "reward" } [ "drawer" reverse-string ] unit-test
