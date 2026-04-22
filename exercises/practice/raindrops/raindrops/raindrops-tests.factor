USING: io kernel lexer raindrops tools.test unicode ;
IN: raindrops.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Raindrops:" print

"the sound for 1 is 1" print
{ "1" } [ 1 convert ] unit-test

STOP-HERE

"the sound for 3 is Pling" print
{ "Pling" } [ 3 convert ] unit-test

"the sound for 5 is Plang" print
{ "Plang" } [ 5 convert ] unit-test

"the sound for 7 is Plong" print
{ "Plong" } [ 7 convert ] unit-test

"the sound for 6 is Pling as it has a factor 3" print
{ "Pling" } [ 6 convert ] unit-test

"2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base" print
{ "8" } [ 8 convert ] unit-test

"the sound for 9 is Pling as it has a factor 3" print
{ "Pling" } [ 9 convert ] unit-test

"the sound for 10 is Plang as it has a factor 5" print
{ "Plang" } [ 10 convert ] unit-test

"the sound for 14 is Plong as it has a factor of 7" print
{ "Plong" } [ 14 convert ] unit-test

"the sound for 15 is PlingPlang as it has factors 3 and 5" print
{ "PlingPlang" } [ 15 convert ] unit-test

"the sound for 21 is PlingPlong as it has factors 3 and 7" print
{ "PlingPlong" } [ 21 convert ] unit-test

"the sound for 25 is Plang as it has a factor 5" print
{ "Plang" } [ 25 convert ] unit-test

"the sound for 27 is Pling as it has a factor 3" print
{ "Pling" } [ 27 convert ] unit-test

"the sound for 35 is PlangPlong as it has factors 5 and 7" print
{ "PlangPlong" } [ 35 convert ] unit-test

"the sound for 49 is Plong as it has a factor 7" print
{ "Plong" } [ 49 convert ] unit-test

"the sound for 52 is 52" print
{ "52" } [ 52 convert ] unit-test

"the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7" print
{ "PlingPlangPlong" } [ 105 convert ] unit-test

"the sound for 3125 is Plang as it has a factor 5" print
{ "Plang" } [ 3125 convert ] unit-test
