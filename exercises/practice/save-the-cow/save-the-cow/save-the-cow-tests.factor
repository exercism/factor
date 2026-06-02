USING: exercism-tools io kernel save-the-cow tools.test unicode ;
IN: save-the-cow.tests

"Initially 9 failures are allowed and no letters are guessed" description
{ "Ongoing" "____" 9 } [ "loot" "" guess ] unit-test

STOP-HERE

"After 10 failures the game is over" description
{ "Lose" "____" 0 } [ "loot" "abcdefghij" guess ] unit-test

"Losing with several correct guesses" description
{ "Lose" "_oot" 0 } [ "loot" "toabcdefghij" guess ] unit-test

"Feeding a correct letter removes underscores" description
{ "Ongoing" "___t" 9 } [ "loot" "t" guess ] unit-test

"Feeding a correct letter twice counts as a failure" description
{ "Ongoing" "___t" 8 } [ "loot" "tt" guess ] unit-test

"Guessing a repeated letter reveals all instances" description
{ "Ongoing" "_oot" 8 } [ "loot" "tto" guess ] unit-test

"Getting all the letters right makes for a win" description
{ "Win" "loot" 8 } [ "loot" "ttol" guess ] unit-test

"Winning on the last guess is still a win" description
{ "Win" "loot" 0 } [ "loot" "abcdefghitol" guess ] unit-test

"Guessing after a lose is error" description
[ "loot" "abcdefghijk" guess ] must-fail

"Guessing after a win is error" description
[ "loot" "toll" guess ] must-fail
