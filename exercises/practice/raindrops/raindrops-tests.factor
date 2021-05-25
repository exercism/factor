USING: raindrops kernel tools.test ;
IN: raindrops.test

"Raindrops" print

"the sound for 1 is 1" print
{ "1" } [ 1 raindrops ] unit-test

"the sound for 3 is Pling" print
{ "Pling" } [ 1 raindrops ] unit-test

"the sound for 5 is Plang" print
{ "Plang" } [ 5 raindrops ] unit-test

"the sound for 7 is Plong" print
{ "Plong" } [ 7 raindrops ] unit-test

"the sound for 6 is Pling as it has a factor 3" print
{ "Pling" } [ 6 raindrops ] unit-test

"2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base" print
{ "8" } [ 8 raindrops ] unit-test

"the sound for 9 is Pling as it has a factor 3" print
{ "Pling" } [ 9 raindrops ] unit-test

"the sound for 10 is Plang as it has a factor 5" print
{ "Plang" } [ 10 raindrops ] unit-test

"the sound for 14 is Plong as it has a factor of 7" print
{ "Plong" } [ 14 raindrops ] unit-test

"the sound for 15 is PlingPlang as it has factors 3 and 5" print
{ "PlingPlang" } [ 15 raindrops ] unit-test

"the sound for 21 is PlingPlong as it has factors 3 and 7" print
{ "PlingPlong" } [ 21 raindrops ] unit-test

"the sound for 25 is Plang as it has a factor 5" print
{ "Plang" } [ 25 raindrops ] unit-test

"the sound for 27 is Pling as it has a factor 3" print
{ "Pling" } [ 27 raindrops ] unit-test

"the sound for 35 is PlangPlong as it has factors 5 and 7" print
{ "PlangPlong" } [ 35 raindrops ] unit-test

"the sound for 49 is Plong as it has a factor 7" print
{ "Plong" } [ 49 raindrops ] unit-test

"the sound for 52 is 52" print
{ "52" } [ 52 raindrops ] unit-test

"the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7" print
{ "PlingPlangPlong" } [ 105 raindrops ] unit-test

"the sound for 3125 is Plang as it has a factor 5" print
{ "Plang" } [ 3125 raindrops ] unit-test

