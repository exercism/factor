USING: exercism-tools io kernel largest-series-product tools.test unicode ;
IN: largest-series-product.tests

"finds the largest product if span equals length" description
{ 18 }
[ "29" 2 largest-product ] unit-test

STOP-HERE

"can find the largest product of 2 with numbers in order" description
{ 72 }
[ "0123456789" 2 largest-product ] unit-test

"can find the largest product of 2" description
{ 48 }
[ "576802143" 2 largest-product ] unit-test

"can find the largest product of 3 with numbers in order" description
{ 504 }
[ "0123456789" 3 largest-product ] unit-test

"can find the largest product of 3" description
{ 270 }
[ "1027839564" 3 largest-product ] unit-test

"can find the largest product of 5 with numbers in order" description
{ 15120 }
[ "0123456789" 5 largest-product ] unit-test

"can get the largest product of a big number" description
{ 23520 }
[ "73167176531330624919225119674426574742355349194934" 6 largest-product ] unit-test

"reports zero if the only digits are zero" description
{ 0 }
[ "0000" 2 largest-product ] unit-test

"reports zero if all spans include zero" description
{ 0 }
[ "99099" 3 largest-product ] unit-test

"rejects span longer than string length" description
[ "123" 4 largest-product ] [ invalid-input? ] must-fail-with

"reports 1 for empty string and empty product (0 span)" description
{ 1 }
[ "" 0 largest-product ] unit-test

"reports 1 for nonempty string and empty product (0 span)" description
{ 1 }
[ "123" 0 largest-product ] unit-test

"rejects empty string and nonzero span" description
[ "" 1 largest-product ] [ invalid-input? ] must-fail-with

"rejects invalid character in digits" description
[ "1234a5" 2 largest-product ] [ invalid-input? ] must-fail-with

"rejects negative span" description
[ "12345" -1 largest-product ] [ invalid-input? ] must-fail-with
