USING: book-store exercism-tools io kernel tools.test unicode ;
IN: book-store.tests

"Only a single book" description
{ 800 }
[ { 1 } total ] unit-test

STOP-HERE

"Two of the same book" description
{ 1600 }
[ { 2 2 } total ] unit-test

"Empty basket" description
{ 0 }
[ {  } total ] unit-test

"Two different books" description
{ 1520 }
[ { 1 2 } total ] unit-test

"Three different books" description
{ 2160 }
[ { 1 2 3 } total ] unit-test

"Four different books" description
{ 2560 }
[ { 1 2 3 4 } total ] unit-test

"Five different books" description
{ 3000 }
[ { 1 2 3 4 5 } total ] unit-test

"Two groups of four is cheaper than group of five plus group of three" description
{ 5120 }
[ { 1 1 2 2 3 3 4 5 } total ] unit-test

"Two groups of four is cheaper than groups of five and three" description
{ 5120 }
[ { 1 1 2 3 4 4 5 5 } total ] unit-test

"Group of four plus group of two is cheaper than two groups of three" description
{ 4080 }
[ { 1 1 2 2 3 4 } total ] unit-test

"Two each of first four books and one copy each of rest" description
{ 5560 }
[ { 1 1 2 2 3 3 4 4 5 } total ] unit-test

"Two copies of each book" description
{ 6000 }
[ { 1 1 2 2 3 3 4 4 5 5 } total ] unit-test

"Three copies of first book and two each of remaining" description
{ 6800 }
[ { 1 1 2 2 3 3 4 4 5 5 1 } total ] unit-test

"Three each of first two books and two each of remaining books" description
{ 7520 }
[ { 1 1 2 2 3 3 4 4 5 5 1 2 } total ] unit-test

"Four groups of four are cheaper than two groups each of five and three" description
{ 10240 }
[ { 1 1 2 2 3 3 4 5 1 1 2 2 3 3 4 5 } total ] unit-test

"Check that groups of four are created properly even when there are more groups of three than groups of five" description
{ 14560 }
[ { 1 1 1 1 1 1 2 2 2 2 2 2 3 3 3 3 3 3 4 4 5 5 } total ] unit-test

"One group of one and four is cheaper than one group of two and three" description
{ 3360 }
[ { 1 1 2 3 4 } total ] unit-test

"One group of one and two plus three groups of four is cheaper than one group of each size" description
{ 10000 }
[ { 1 2 2 3 3 3 4 4 4 4 5 5 5 5 5 } total ] unit-test
