USING: exercism-tools io kernel reverse-string tools.test unicode ;
IN: reverse-string.tests

"an empty string" description
{ "" } [ "" reverse-string ] unit-test

STOP-HERE

"a word" description
{ "tobor" } [ "robot" reverse-string ] unit-test

"a capitalized word" description
{ "nemaR" } [ "Ramen" reverse-string ] unit-test

"a sentence with punctuation" description
{ "!yrgnuh m'I" } [ "I'm hungry!" reverse-string ] unit-test

"a palindrome" description
{ "racecar" } [ "racecar" reverse-string ] unit-test

"an even-sized word" description
{ "reward" } [ "drawer" reverse-string ] unit-test
