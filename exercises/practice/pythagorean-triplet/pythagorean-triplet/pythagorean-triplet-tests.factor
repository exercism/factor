USING: exercism-tools io kernel pythagorean-triplet tools.test unicode ;
IN: pythagorean-triplet.tests

"Pythagorean Triplet:" print

"triplets whose sum is 12" print
{ { { 3 4 5 } } }
[ 12 triplets-with-sum ] unit-test

STOP-HERE

"triplets whose sum is 108" print
{ { { 27 36 45 } } }
[ 108 triplets-with-sum ] unit-test

"triplets whose sum is 1000" print
{ { { 200 375 425 } } }
[ 1000 triplets-with-sum ] unit-test

"no matching triplets for 1001" print
{ {  } }
[ 1001 triplets-with-sum ] unit-test

"returns all matching triplets" print
{ { { 9 40 41 } { 15 36 39 } } }
[ 90 triplets-with-sum ] unit-test

"several matching triplets" print
{ { { 40 399 401 } { 56 390 394 } { 105 360 375 } { 120 350 370 } { 140 336 364 } { 168 315 357 } { 210 280 350 } { 240 252 348 } } }
[ 840 triplets-with-sum ] unit-test

"triplets for large number" print
{ { { 1200 14375 14425 } { 1875 14000 14125 } { 5000 12000 13000 } { 6000 11250 12750 } { 7500 10000 12500 } } }
[ 30000 triplets-with-sum ] unit-test

"triplets for very large number" print
{ { { 68145 71672 98897 } } }
[ 238714 triplets-with-sum ] unit-test
