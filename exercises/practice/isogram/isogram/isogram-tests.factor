USING: io isogram kernel lexer tools.test unicode ;
IN: isogram.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Isogram:" print

"empty string" print
{ t } [ "" isogram? ] unit-test

STOP-HERE

"isogram with only lower case characters" print
{ t } [ "isogram" isogram? ] unit-test

"word with one duplicated character" print
{ f } [ "eleven" isogram? ] unit-test

"word with one duplicated character from the end of the alphabet" print
{ f } [ "zzyzx" isogram? ] unit-test

"longest reported english isogram" print
{ t } [ "subdermatoglyphic" isogram? ] unit-test

"word with duplicated character in mixed case" print
{ f } [ "Alphabet" isogram? ] unit-test

"word with duplicated character in mixed case, lowercase first" print
{ f } [ "alphAbet" isogram? ] unit-test

"hypothetical isogrammic word with hyphen" print
{ t } [ "thumbscrew-japingly" isogram? ] unit-test

"hypothetical word with duplicated character following hyphen" print
{ f } [ "thumbscrew-jappingly" isogram? ] unit-test

"isogram with duplicated hyphen" print
{ t } [ "six-year-old" isogram? ] unit-test

"made-up name that is an isogram" print
{ t } [ "Emily Jung Schwartzkopf" isogram? ] unit-test

"duplicated character in the middle" print
{ f } [ "accentor" isogram? ] unit-test

"same first and last characters" print
{ f } [ "angola" isogram? ] unit-test

"word with duplicated character and with two hyphens" print
{ f } [ "up-to-date" isogram? ] unit-test
