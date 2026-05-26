USING: exercism-tools io isogram kernel tools.test unicode ;
IN: isogram.tests

"empty string" description
{ t } [ "" isogram? ] unit-test

STOP-HERE

"isogram with only lower case characters" description
{ t } [ "isogram" isogram? ] unit-test

"word with one duplicated character" description
{ f } [ "eleven" isogram? ] unit-test

"word with one duplicated character from the end of the alphabet" description
{ f } [ "zzyzx" isogram? ] unit-test

"longest reported english isogram" description
{ t } [ "subdermatoglyphic" isogram? ] unit-test

"word with duplicated character in mixed case" description
{ f } [ "Alphabet" isogram? ] unit-test

"word with duplicated character in mixed case, lowercase first" description
{ f } [ "alphAbet" isogram? ] unit-test

"hypothetical isogrammic word with hyphen" description
{ t } [ "thumbscrew-japingly" isogram? ] unit-test

"hypothetical word with duplicated character following hyphen" description
{ f } [ "thumbscrew-jappingly" isogram? ] unit-test

"isogram with duplicated hyphen" description
{ t } [ "six-year-old" isogram? ] unit-test

"made-up name that is an isogram" description
{ t } [ "Emily Jung Schwartzkopf" isogram? ] unit-test

"duplicated character in the middle" description
{ f } [ "accentor" isogram? ] unit-test

"same first and last characters" description
{ f } [ "angola" isogram? ] unit-test

"word with duplicated character and with two hyphens" description
{ f } [ "up-to-date" isogram? ] unit-test
