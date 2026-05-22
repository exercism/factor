USING: book-store exercism-tools io kernel tools.test unicode ;
IN: book-store.tests

"Book Store:" print

"Only a single book" print
{ 800 }
[ { 1 } total ] unit-test

STOP-HERE

"Two of the same book" print
{ 1600 }
[ { 2 2 } total ] unit-test

"Empty basket" print
{ 0 }
[ {  } total ] unit-test

"Two different books" print
{ 1520 }
[ { 1 2 } total ] unit-test

"Three different books" print
{ 2160 }
[ { 1 2 3 } total ] unit-test

"Four different books" print
{ 2560 }
[ { 1 2 3 4 } total ] unit-test

"Five different books" print
{ 3000 }
[ { 1 2 3 4 5 } total ] unit-test

"Two groups of four is cheaper than group of five plus group of three" print
{ 5120 }
[ { 1 1 2 2 3 3 4 5 } total ] unit-test

"Two groups of four is cheaper than groups of five and three" print
{ 5120 }
[ { 1 1 2 3 4 4 5 5 } total ] unit-test

"Group of four plus group of two is cheaper than two groups of three" print
{ 4080 }
[ { 1 1 2 2 3 4 } total ] unit-test

"Two each of first four books and one copy each of rest" print
{ 5560 }
[ { 1 1 2 2 3 3 4 4 5 } total ] unit-test

"Two copies of each book" print
{ 6000 }
[ { 1 1 2 2 3 3 4 4 5 5 } total ] unit-test

"Three copies of first book and two each of remaining" print
{ 6800 }
[ { 1 1 2 2 3 3 4 4 5 5 1 } total ] unit-test

"Three each of first two books and two each of remaining books" print
{ 7520 }
[ { 1 1 2 2 3 3 4 4 5 5 1 2 } total ] unit-test

"Four groups of four are cheaper than two groups each of five and three" print
{ 10240 }
[ { 1 1 2 2 3 3 4 5 1 1 2 2 3 3 4 5 } total ] unit-test

"Check that groups of four are created properly even when there are more groups of three than groups of five" print
{ 14560 }
[ { 1 1 1 1 1 1 2 2 2 2 2 2 3 3 3 3 3 3 4 4 5 5 } total ] unit-test

"One group of one and four is cheaper than one group of two and three" print
{ 3360 }
[ { 1 1 2 3 4 } total ] unit-test

"One group of one and two plus three groups of four is cheaper than one group of each size" print
{ 10000 }
[ { 1 2 2 3 3 3 4 4 4 4 5 5 5 5 5 } total ] unit-test
