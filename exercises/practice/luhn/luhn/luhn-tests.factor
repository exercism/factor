USING: io kernel lexer luhn tools.test unicode ;
IN: luhn.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Luhn:" print

"single digit strings can not be valid" print
{ f } [ "1" valid? ] unit-test

STOP-HERE

"a single zero is invalid" print
{ f } [ "0" valid? ] unit-test

"a simple valid SIN that remains valid if reversed" print
{ t } [ "059" valid? ] unit-test

"a simple valid SIN that becomes invalid if reversed" print
{ t } [ "59" valid? ] unit-test

"a valid Canadian SIN" print
{ t } [ "055 444 285" valid? ] unit-test

"invalid Canadian SIN" print
{ f } [ "055 444 286" valid? ] unit-test

"invalid credit card" print
{ f } [ "8273 1232 7352 0569" valid? ] unit-test

"invalid long number with an even remainder" print
{ f } [ "1 2345 6789 1234 5678 9012" valid? ] unit-test

"invalid long number with a remainder divisible by 5" print
{ f } [ "1 2345 6789 1234 5678 9013" valid? ] unit-test

"valid number with an even number of digits" print
{ t } [ "095 245 88" valid? ] unit-test

"valid number with an odd number of spaces" print
{ t } [ "234 567 891 234" valid? ] unit-test

"valid strings with a non-digit added at the end become invalid" print
{ f } [ "059a" valid? ] unit-test

"valid strings with punctuation included become invalid" print
{ f } [ "055-444-285" valid? ] unit-test

"valid strings with symbols included become invalid" print
{ f } [ "055# 444$ 285" valid? ] unit-test

"single zero with space is invalid" print
{ f } [ " 0" valid? ] unit-test

"more than a single zero is valid" print
{ t } [ "0000 0" valid? ] unit-test

"input digit 9 is correctly converted to output digit 9" print
{ t } [ "091" valid? ] unit-test

"very long input is valid" print
{ t } [ "9999999999 9999999999 9999999999 9999999999" valid? ] unit-test

"valid luhn with an odd number of digits and non zero first digit" print
{ t } [ "109" valid? ] unit-test

"using ascii value for non-doubled non-digit isn't allowed" print
{ f } [ "055b 444 285" valid? ] unit-test

"using ascii value for doubled non-digit isn't allowed" print
{ f } [ ":9" valid? ] unit-test

"non-numeric, non-space char in the middle with a sum that's divisible by 10 isn't allowed" print
{ f } [ "59%59" valid? ] unit-test
