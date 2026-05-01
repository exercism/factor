USING: exercism-tools io kernel say tools.test unicode ;
IN: say.tests

"Say:" print

"zero" print
{ "zero" }
[ 0 say ] unit-test

STOP-HERE

"one" print
{ "one" }
[ 1 say ] unit-test

"fourteen" print
{ "fourteen" }
[ 14 say ] unit-test

"twenty" print
{ "twenty" }
[ 20 say ] unit-test

"twenty-two" print
{ "twenty-two" }
[ 22 say ] unit-test

"thirty" print
{ "thirty" }
[ 30 say ] unit-test

"ninety-nine" print
{ "ninety-nine" }
[ 99 say ] unit-test

"one hundred" print
{ "one hundred" }
[ 100 say ] unit-test

"one hundred twenty-three" print
{ "one hundred twenty-three" }
[ 123 say ] unit-test

"two hundred" print
{ "two hundred" }
[ 200 say ] unit-test

"nine hundred ninety-nine" print
{ "nine hundred ninety-nine" }
[ 999 say ] unit-test

"one thousand" print
{ "one thousand" }
[ 1000 say ] unit-test

"one thousand two hundred thirty-four" print
{ "one thousand two hundred thirty-four" }
[ 1234 say ] unit-test

"one million" print
{ "one million" }
[ 1000000 say ] unit-test

"one million two thousand three hundred forty-five" print
{ "one million two thousand three hundred forty-five" }
[ 1002345 say ] unit-test

"one billion" print
{ "one billion" }
[ 1000000000 say ] unit-test

"a big number" print
{ "nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three" }
[ 987654321123 say ] unit-test

"numbers below zero are out of range" print
[ -1 say ] [ "input out of range" = ] must-fail-with

"numbers above 999,999,999,999 are out of range" print
[ 1000000000000 say ] [ "input out of range" = ] must-fail-with

"additional big number" print
{ "nineteen billion eleven million sixteen thousand thirteen" }
[ 19011016013 say ] unit-test

"different big number" print
{ "eight hundred twelve billion seventy thousand seventeen" }
[ 812000070017 say ] unit-test

"alternative big number" print
{ "sixty billion ten million fifteen thousand eighteen" }
[ 60010015018 say ] unit-test
