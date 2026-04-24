USING: io kernel lexer tools.test unicode yacht ;
IN: yacht.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Yacht:" print

"Yacht" print
{ 50 } [ { 5 5 5 5 5 } "yacht" score ] unit-test

STOP-HERE

"Not Yacht" print
{ 0 } [ { 1 3 3 2 5 } "yacht" score ] unit-test

"Ones" print
{ 3 } [ { 1 1 1 3 5 } "ones" score ] unit-test

"Ones, out of order" print
{ 3 } [ { 3 1 1 5 1 } "ones" score ] unit-test

"No ones" print
{ 0 } [ { 4 3 6 5 5 } "ones" score ] unit-test

"Twos" print
{ 2 } [ { 2 3 4 5 6 } "twos" score ] unit-test

"Fours" print
{ 8 } [ { 1 4 1 4 1 } "fours" score ] unit-test

"Yacht counted as threes" print
{ 15 } [ { 3 3 3 3 3 } "threes" score ] unit-test

"Yacht of 3s counted as fives" print
{ 0 } [ { 3 3 3 3 3 } "fives" score ] unit-test

"Fives" print
{ 10 } [ { 1 5 3 5 3 } "fives" score ] unit-test

"Sixes" print
{ 6 } [ { 2 3 4 5 6 } "sixes" score ] unit-test

"Full house two small, three big" print
{ 16 } [ { 2 2 4 4 4 } "full house" score ] unit-test

"Full house three small, two big" print
{ 19 } [ { 5 3 3 5 3 } "full house" score ] unit-test

"Two pair is not a full house" print
{ 0 } [ { 2 2 4 4 5 } "full house" score ] unit-test

"Four of a kind is not a full house" print
{ 0 } [ { 1 4 4 4 4 } "full house" score ] unit-test

"Yacht is not a full house" print
{ 0 } [ { 2 2 2 2 2 } "full house" score ] unit-test

"Four of a Kind" print
{ 24 } [ { 6 6 4 6 6 } "four of a kind" score ] unit-test

"Yacht can be scored as Four of a Kind" print
{ 12 } [ { 3 3 3 3 3 } "four of a kind" score ] unit-test

"Full house is not Four of a Kind" print
{ 0 } [ { 3 3 3 5 5 } "four of a kind" score ] unit-test

"Little Straight" print
{ 30 } [ { 3 5 4 1 2 } "little straight" score ] unit-test

"Little Straight as Big Straight" print
{ 0 } [ { 1 2 3 4 5 } "big straight" score ] unit-test

"Four in order but not a little straight" print
{ 0 } [ { 1 1 2 3 4 } "little straight" score ] unit-test

"No pairs but not a little straight" print
{ 0 } [ { 1 2 3 4 6 } "little straight" score ] unit-test

"Minimum is 1, maximum is 5, but not a little straight" print
{ 0 } [ { 1 1 3 4 5 } "little straight" score ] unit-test

"Big Straight" print
{ 30 } [ { 4 6 2 5 3 } "big straight" score ] unit-test

"Big Straight as little straight" print
{ 0 } [ { 6 5 4 3 2 } "little straight" score ] unit-test

"No pairs but not a big straight" print
{ 0 } [ { 6 5 4 3 1 } "big straight" score ] unit-test

"Choice" print
{ 23 } [ { 3 3 5 6 6 } "choice" score ] unit-test

"Yacht as choice" print
{ 10 } [ { 2 2 2 2 2 } "choice" score ] unit-test
