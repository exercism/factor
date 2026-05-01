USING: exercism-tools io kernel matching-brackets tools.test unicode ;
IN: matching-brackets.tests

"Matching Brackets:" print

"paired square brackets" print
{ t } [ "[]" paired? ] unit-test

STOP-HERE

"empty string" print
{ t } [ "" paired? ] unit-test

"unpaired brackets" print
{ f } [ "[[" paired? ] unit-test

"wrong ordered brackets" print
{ f } [ "}{" paired? ] unit-test

"wrong closing bracket" print
{ f } [ "{]" paired? ] unit-test

"paired with whitespace" print
{ t } [ "{ }" paired? ] unit-test

"partially paired brackets" print
{ f } [ "{[])" paired? ] unit-test

"simple nested brackets" print
{ t } [ "{[]}" paired? ] unit-test

"several paired brackets" print
{ t } [ "{}[]" paired? ] unit-test

"paired and nested brackets" print
{ t } [ "([{}({}[])])" paired? ] unit-test

"unopened closing brackets" print
{ f } [ "{[)][]}" paired? ] unit-test

"unpaired and nested brackets" print
{ f } [ "([{])" paired? ] unit-test

"paired and wrong nested brackets" print
{ f } [ "[({]})" paired? ] unit-test

"paired and wrong nested brackets but innermost are correct" print
{ f } [ "[({}])" paired? ] unit-test

"paired and incomplete brackets" print
{ f } [ "{}[" paired? ] unit-test

"too many closing brackets" print
{ f } [ "[]]" paired? ] unit-test

"early unexpected brackets" print
{ f } [ ")()" paired? ] unit-test

"early mismatched brackets" print
{ f } [ "{)()" paired? ] unit-test

"math expression" print
{ t } [ "(((185 + 223.85) * 15) - 543)/2" paired? ] unit-test

"complex latex expression" print
{ t } [ "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)" paired? ] unit-test
