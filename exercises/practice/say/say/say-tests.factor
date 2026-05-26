USING: exercism-tools io kernel say tools.test unicode ;
IN: say.tests

"zero" description
{ "zero" }
[ 0 say ] unit-test

STOP-HERE

"one" description
{ "one" }
[ 1 say ] unit-test

"fourteen" description
{ "fourteen" }
[ 14 say ] unit-test

"twenty" description
{ "twenty" }
[ 20 say ] unit-test

"twenty-two" description
{ "twenty-two" }
[ 22 say ] unit-test

"thirty" description
{ "thirty" }
[ 30 say ] unit-test

"ninety-nine" description
{ "ninety-nine" }
[ 99 say ] unit-test

"one hundred" description
{ "one hundred" }
[ 100 say ] unit-test

"one hundred twenty-three" description
{ "one hundred twenty-three" }
[ 123 say ] unit-test

"two hundred" description
{ "two hundred" }
[ 200 say ] unit-test

"nine hundred ninety-nine" description
{ "nine hundred ninety-nine" }
[ 999 say ] unit-test

"one thousand" description
{ "one thousand" }
[ 1000 say ] unit-test

"one thousand two hundred thirty-four" description
{ "one thousand two hundred thirty-four" }
[ 1234 say ] unit-test

"one million" description
{ "one million" }
[ 1000000 say ] unit-test

"one million two thousand three hundred forty-five" description
{ "one million two thousand three hundred forty-five" }
[ 1002345 say ] unit-test

"one billion" description
{ "one billion" }
[ 1000000000 say ] unit-test

"a big number" description
{ "nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three" }
[ 987654321123 say ] unit-test

"numbers below zero are out of range" description
[ -1 say ] [ "input out of range" = ] must-fail-with

"numbers above 999,999,999,999 are out of range" description
[ 1000000000000 say ] [ "input out of range" = ] must-fail-with

"additional big number" description
{ "nineteen billion eleven million sixteen thousand thirteen" }
[ 19011016013 say ] unit-test

"different big number" description
{ "eight hundred twelve billion seventy thousand seventeen" }
[ 812000070017 say ] unit-test

"alternative big number" description
{ "sixty billion ten million fifteen thousand eighteen" }
[ 60010015018 say ] unit-test
