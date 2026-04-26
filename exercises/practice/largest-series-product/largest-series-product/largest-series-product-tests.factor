USING: io kernel largest-series-product lexer tools.test unicode ;
IN: largest-series-product.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Largest Series Product:" print

"finds the largest product if span equals length" print
{ 18 }
[ "29" 2 largest-product ] unit-test

STOP-HERE

"can find the largest product of 2 with numbers in order" print
{ 72 }
[ "0123456789" 2 largest-product ] unit-test

"can find the largest product of 2" print
{ 48 }
[ "576802143" 2 largest-product ] unit-test

"can find the largest product of 3 with numbers in order" print
{ 504 }
[ "0123456789" 3 largest-product ] unit-test

"can find the largest product of 3" print
{ 270 }
[ "1027839564" 3 largest-product ] unit-test

"can find the largest product of 5 with numbers in order" print
{ 15120 }
[ "0123456789" 5 largest-product ] unit-test

"can get the largest product of a big number" print
{ 23520 }
[ "73167176531330624919225119674426574742355349194934" 6 largest-product ] unit-test

"reports zero if the only digits are zero" print
{ 0 }
[ "0000" 2 largest-product ] unit-test

"reports zero if all spans include zero" print
{ 0 }
[ "99099" 3 largest-product ] unit-test

"rejects span longer than string length" print
[ "123" 4 largest-product ] [ invalid-input? ] must-fail-with

"reports 1 for empty string and empty product (0 span)" print
{ 1 }
[ "" 0 largest-product ] unit-test

"reports 1 for nonempty string and empty product (0 span)" print
{ 1 }
[ "123" 0 largest-product ] unit-test

"rejects empty string and nonzero span" print
[ "" 1 largest-product ] [ invalid-input? ] must-fail-with

"rejects invalid character in digits" print
[ "1234a5" 2 largest-product ] [ invalid-input? ] must-fail-with

"rejects negative span" print
[ "12345" -1 largest-product ] [ invalid-input? ] must-fail-with
