USING: io kernel lexer phone-number tools.test unicode ;
IN: phone-number.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Phone Number:" print

"cleans the number" print
{ "2234567890" }
[ "(223) 456-7890" clean ] unit-test

STOP-HERE

"cleans numbers with dots" print
{ "2234567890" }
[ "223.456.7890" clean ] unit-test

"cleans numbers with multiple spaces" print
{ "2234567890" }
[ "223 456   7890   " clean ] unit-test

"invalid when 9 digits" print
[ "123456789" clean ] [ invalid-phone-number? ] must-fail-with

"invalid when 11 digits does not start with a 1" print
[ "22234567890" clean ] [ invalid-phone-number? ] must-fail-with

"valid when 11 digits and starting with 1" print
{ "2234567890" }
[ "12234567890" clean ] unit-test

"valid when 11 digits and starting with 1 even with punctuation" print
{ "2234567890" }
[ "+1 (223) 456-7890" clean ] unit-test

"invalid when more than 11 digits" print
[ "321234567890" clean ] [ invalid-phone-number? ] must-fail-with

"invalid with letters" print
[ "523-abc-7890" clean ] [ invalid-phone-number? ] must-fail-with

"invalid with punctuations" print
[ "523-@:!-7890" clean ] [ invalid-phone-number? ] must-fail-with

"invalid if area code starts with 0" print
[ "(023) 456-7890" clean ] [ invalid-phone-number? ] must-fail-with

"invalid if area code starts with 1" print
[ "(123) 456-7890" clean ] [ invalid-phone-number? ] must-fail-with

"invalid if exchange code starts with 0" print
[ "(223) 056-7890" clean ] [ invalid-phone-number? ] must-fail-with

"invalid if exchange code starts with 1" print
[ "(223) 156-7890" clean ] [ invalid-phone-number? ] must-fail-with

"invalid if area code starts with 0 on valid 11-digit number" print
[ "1 (023) 456-7890" clean ] [ invalid-phone-number? ] must-fail-with

"invalid if area code starts with 1 on valid 11-digit number" print
[ "1 (123) 456-7890" clean ] [ invalid-phone-number? ] must-fail-with

"invalid if exchange code starts with 0 on valid 11-digit number" print
[ "1 (223) 056-7890" clean ] [ invalid-phone-number? ] must-fail-with

"invalid if exchange code starts with 1 on valid 11-digit number" print
[ "1 (223) 156-7890" clean ] [ invalid-phone-number? ] must-fail-with
