USING: exercism-tools io kernel phone-number tools.test unicode ;
IN: phone-number.tests

"cleans the number" description
{ "2234567890" }
[ "(223) 456-7890" clean ] unit-test

STOP-HERE

"cleans numbers with dots" description
{ "2234567890" }
[ "223.456.7890" clean ] unit-test

"cleans numbers with multiple spaces" description
{ "2234567890" }
[ "223 456   7890   " clean ] unit-test

"invalid when 9 digits" description
[ "123456789" clean ] [ invalid-phone-number? ] must-fail-with

"invalid when 11 digits does not start with a 1" description
[ "22234567890" clean ] [ invalid-phone-number? ] must-fail-with

"valid when 11 digits and starting with 1" description
{ "2234567890" }
[ "12234567890" clean ] unit-test

"valid when 11 digits and starting with 1 even with punctuation" description
{ "2234567890" }
[ "+1 (223) 456-7890" clean ] unit-test

"invalid when more than 11 digits" description
[ "321234567890" clean ] [ invalid-phone-number? ] must-fail-with

"invalid with letters" description
[ "523-abc-7890" clean ] [ invalid-phone-number? ] must-fail-with

"invalid with punctuations" description
[ "523-@:!-7890" clean ] [ invalid-phone-number? ] must-fail-with

"invalid if area code starts with 0" description
[ "(023) 456-7890" clean ] [ invalid-phone-number? ] must-fail-with

"invalid if area code starts with 1" description
[ "(123) 456-7890" clean ] [ invalid-phone-number? ] must-fail-with

"invalid if exchange code starts with 0" description
[ "(223) 056-7890" clean ] [ invalid-phone-number? ] must-fail-with

"invalid if exchange code starts with 1" description
[ "(223) 156-7890" clean ] [ invalid-phone-number? ] must-fail-with

"invalid if area code starts with 0 on valid 11-digit number" description
[ "1 (023) 456-7890" clean ] [ invalid-phone-number? ] must-fail-with

"invalid if area code starts with 1 on valid 11-digit number" description
[ "1 (123) 456-7890" clean ] [ invalid-phone-number? ] must-fail-with

"invalid if exchange code starts with 0 on valid 11-digit number" description
[ "1 (223) 056-7890" clean ] [ invalid-phone-number? ] must-fail-with

"invalid if exchange code starts with 1 on valid 11-digit number" description
[ "1 (223) 156-7890" clean ] [ invalid-phone-number? ] must-fail-with
