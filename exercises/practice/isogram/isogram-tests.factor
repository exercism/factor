USING: io isogram tools.test ;
IN: isogram.tests

"Isogram:" print

"empty string" print
{ t } [ "" isogram? ] unit-test

"isogram with only lower case characters" print
{ t } [ "isogram" isogram? ] unit-test

"word with one duplicated character" print
{ f } [ "eleven" isogram? ] unit-test

"longest reported english isogram" print
{ t } [ "subdermatoglyphic" isogram? ] unit-test

"word with duplicated character in mixed case" print
{ f } [ "Alphabet" isogram? ] unit-test

"hypothetical isogrammic word with hyphen" print
{ t } [ "thumbscrew-japingly" isogram? ] unit-test

"isogram with duplicated non letter character" print
{ t } [ "Hjelmqvist-Gryb-Zock-Pfund-Wax" isogram? ] unit-test

"made-up name that is an isogram" print
{ t } [ "Emily Jung Schwartzkopf" isogram? ] unit-test

"duplicated character in the middle" print
{ f } [ "accentor" isogram? ] unit-test

"word with duplicated character and with two hyphens" print
{ f } [ "up-to-date" isogram? ] unit-test

