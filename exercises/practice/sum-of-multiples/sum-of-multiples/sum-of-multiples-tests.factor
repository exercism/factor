USING: io kernel lexer sum-of-multiples tools.test unicode ;
IN: sum-of-multiples.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Sum Of Multiples:" print

"no multiples within limit" print
{ 0 } [ { 3 5 } 1 sum-of-multiples ] unit-test

STOP-HERE

"one factor has multiples within limit" print
{ 3 } [ { 3 5 } 4 sum-of-multiples ] unit-test

"more than one multiple within limit" print
{ 9 } [ { 3 } 7 sum-of-multiples ] unit-test

"more than one factor with multiples within limit" print
{ 23 } [ { 3 5 } 10 sum-of-multiples ] unit-test

"each multiple is only counted once" print
{ 2318 } [ { 3 5 } 100 sum-of-multiples ] unit-test

"a much larger limit" print
{ 233168 } [ { 3 5 } 1000 sum-of-multiples ] unit-test

"three factors" print
{ 51 } [ { 7 13 17 } 20 sum-of-multiples ] unit-test

"factors not relatively prime" print
{ 30 } [ { 4 6 } 15 sum-of-multiples ] unit-test

"some pairs of factors relatively prime and some not" print
{ 4419 } [ { 5 6 8 } 150 sum-of-multiples ] unit-test

"one factor is a multiple of another" print
{ 275 } [ { 5 25 } 51 sum-of-multiples ] unit-test

"much larger factors" print
{ 2203160 } [ { 43 47 } 10000 sum-of-multiples ] unit-test

"all numbers are multiples of 1" print
{ 4950 } [ { 1 } 100 sum-of-multiples ] unit-test

"no factors means an empty sum" print
{ 0 } [ {  } 10000 sum-of-multiples ] unit-test

"the only multiple of 0 is 0" print
{ 0 } [ { 0 } 1 sum-of-multiples ] unit-test

"the factor 0 does not affect the sum of multiples of other factors" print
{ 3 } [ { 3 0 } 4 sum-of-multiples ] unit-test

"solutions using include-exclude must extend to cardinality greater than 3" print
{ 39614537 } [ { 2 3 5 7 11 } 10000 sum-of-multiples ] unit-test
