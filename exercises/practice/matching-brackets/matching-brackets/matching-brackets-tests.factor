USING: exercism-tools io kernel matching-brackets tools.test unicode ;
IN: matching-brackets.tests

"paired square brackets" description
{ t }
[ "[]" paired? ] unit-test

STOP-HERE

"empty string" description
{ t }
[ "" paired? ] unit-test

"unpaired brackets" description
{ f }
[ "[[" paired? ] unit-test

"wrong ordered brackets" description
{ f }
[ "}{" paired? ] unit-test

"wrong closing bracket" description
{ f }
[ "{]" paired? ] unit-test

"paired with whitespace" description
{ t }
[ "{ }" paired? ] unit-test

"partially paired brackets" description
{ f }
[ "{[])" paired? ] unit-test

"simple nested brackets" description
{ t }
[ "{[]}" paired? ] unit-test

"several paired brackets" description
{ t }
[ "{}[]" paired? ] unit-test

"paired and nested brackets" description
{ t }
[ "([{}({}[])])" paired? ] unit-test

"unopened closing brackets" description
{ f }
[ "{[)][]}" paired? ] unit-test

"unpaired and nested brackets" description
{ f }
[ "([{])" paired? ] unit-test

"paired and wrong nested brackets" description
{ f }
[ "[({]})" paired? ] unit-test

"paired and wrong nested brackets but innermost are correct" description
{ f }
[ "[({}])" paired? ] unit-test

"paired and incomplete brackets" description
{ f }
[ "{}[" paired? ] unit-test

"too many closing brackets" description
{ f }
[ "[]]" paired? ] unit-test

"early unexpected brackets" description
{ f }
[ ")()" paired? ] unit-test

"early mismatched brackets" description
{ f }
[ "{)()" paired? ] unit-test

"math expression" description
{ t }
[ "(((185 + 223.85) * 15) - 543)/2" paired? ] unit-test

"complex latex expression" description
{ t }
[ "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)" paired? ] unit-test
