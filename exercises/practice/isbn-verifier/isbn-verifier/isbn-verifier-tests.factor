USING: exercism-tools io isbn-verifier kernel tools.test unicode ;
IN: isbn-verifier.tests

"Isbn Verifier:" print

"valid isbn" print
{ t } [ "3-598-21508-8" valid? ] unit-test

STOP-HERE

"invalid isbn check digit" print
{ f } [ "3-598-21508-9" valid? ] unit-test

"valid isbn with a check digit of 10" print
{ t } [ "3-598-21507-X" valid? ] unit-test

"check digit is a character other than X" print
{ f } [ "3-598-21507-A" valid? ] unit-test

"invalid check digit in isbn is not treated as zero" print
{ f } [ "4-598-21507-B" valid? ] unit-test

"invalid character in isbn is not treated as zero" print
{ f } [ "3-598-P1581-X" valid? ] unit-test

"X is only valid as a check digit" print
{ f } [ "3-598-2X507-9" valid? ] unit-test

"only one check digit is allowed" print
{ f } [ "3-598-21508-96" valid? ] unit-test

"X is not substituted by the value 10" print
{ f } [ "3-598-2X507-5" valid? ] unit-test

"valid isbn without separating dashes" print
{ t } [ "3598215088" valid? ] unit-test

"isbn without separating dashes and X as check digit" print
{ t } [ "359821507X" valid? ] unit-test

"isbn without check digit and dashes" print
{ f } [ "359821507" valid? ] unit-test

"too long isbn and no dashes" print
{ f } [ "3598215078X" valid? ] unit-test

"too short isbn" print
{ f } [ "00" valid? ] unit-test

"isbn without check digit" print
{ f } [ "3-598-21507" valid? ] unit-test

"check digit of X should not be used for 0" print
{ f } [ "3-598-21515-X" valid? ] unit-test

"empty isbn" print
{ f } [ "" valid? ] unit-test

"input is 9 characters" print
{ f } [ "134456729" valid? ] unit-test

"invalid characters are not ignored after checking length" print
{ f } [ "3132P34035" valid? ] unit-test

"invalid characters are not ignored before checking length" print
{ f } [ "3598P215088" valid? ] unit-test

"input is too long but contains a valid isbn" print
{ f } [ "98245726788" valid? ] unit-test
