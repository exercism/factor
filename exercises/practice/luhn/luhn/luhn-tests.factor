USING: exercism-tools io kernel luhn tools.test unicode ;
IN: luhn.tests

"single digit strings can not be valid" description
{ f } [ "1" valid? ] unit-test

STOP-HERE

"a single zero is invalid" description
{ f } [ "0" valid? ] unit-test

"a simple valid SIN that remains valid if reversed" description
{ t } [ "059" valid? ] unit-test

"a simple valid SIN that becomes invalid if reversed" description
{ t } [ "59" valid? ] unit-test

"a valid Canadian SIN" description
{ t } [ "055 444 285" valid? ] unit-test

"invalid Canadian SIN" description
{ f } [ "055 444 286" valid? ] unit-test

"invalid credit card" description
{ f } [ "8273 1232 7352 0569" valid? ] unit-test

"invalid long number with an even remainder" description
{ f } [ "1 2345 6789 1234 5678 9012" valid? ] unit-test

"invalid long number with a remainder divisible by 5" description
{ f } [ "1 2345 6789 1234 5678 9013" valid? ] unit-test

"valid number with an even number of digits" description
{ t } [ "095 245 88" valid? ] unit-test

"valid number with an odd number of spaces" description
{ t } [ "234 567 891 234" valid? ] unit-test

"valid strings with a non-digit added at the end become invalid" description
{ f } [ "059a" valid? ] unit-test

"valid strings with punctuation included become invalid" description
{ f } [ "055-444-285" valid? ] unit-test

"valid strings with symbols included become invalid" description
{ f } [ "055# 444$ 285" valid? ] unit-test

"single zero with space is invalid" description
{ f } [ " 0" valid? ] unit-test

"more than a single zero is valid" description
{ t } [ "0000 0" valid? ] unit-test

"input digit 9 is correctly converted to output digit 9" description
{ t } [ "091" valid? ] unit-test

"very long input is valid" description
{ t } [ "9999999999 9999999999 9999999999 9999999999" valid? ] unit-test

"valid luhn with an odd number of digits and non zero first digit" description
{ t } [ "109" valid? ] unit-test

"using ascii value for non-doubled non-digit isn't allowed" description
{ f } [ "055b 444 285" valid? ] unit-test

"using ascii value for doubled non-digit isn't allowed" description
{ f } [ ":9" valid? ] unit-test

"non-numeric, non-space char in the middle with a sum that's divisible by 10 isn't allowed" description
{ f } [ "59%59" valid? ] unit-test
