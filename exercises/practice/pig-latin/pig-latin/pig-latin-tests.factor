USING: exercism-tools io kernel pig-latin tools.test unicode ;
IN: pig-latin.tests

"word beginning with a" description
{ "appleay" } [ "apple" translate ] unit-test

STOP-HERE

"word beginning with e" description
{ "earay" } [ "ear" translate ] unit-test

"word beginning with i" description
{ "iglooay" } [ "igloo" translate ] unit-test

"word beginning with o" description
{ "objectay" } [ "object" translate ] unit-test

"word beginning with u" description
{ "underay" } [ "under" translate ] unit-test

"word beginning with a vowel and followed by a qu" description
{ "equalay" } [ "equal" translate ] unit-test

"word beginning with p" description
{ "igpay" } [ "pig" translate ] unit-test

"word beginning with k" description
{ "oalakay" } [ "koala" translate ] unit-test

"word beginning with x" description
{ "enonxay" } [ "xenon" translate ] unit-test

"word beginning with q without a following u" description
{ "atqay" } [ "qat" translate ] unit-test

"word beginning with consonant and vowel containing qu" description
{ "iquidlay" } [ "liquid" translate ] unit-test

"word beginning with ch" description
{ "airchay" } [ "chair" translate ] unit-test

"word beginning with qu" description
{ "eenquay" } [ "queen" translate ] unit-test

"word beginning with qu and a preceding consonant" description
{ "aresquay" } [ "square" translate ] unit-test

"word beginning with th" description
{ "erapythay" } [ "therapy" translate ] unit-test

"word beginning with thr" description
{ "ushthray" } [ "thrush" translate ] unit-test

"word beginning with sch" description
{ "oolschay" } [ "school" translate ] unit-test

"word beginning with yt" description
{ "yttriaay" } [ "yttria" translate ] unit-test

"word beginning with xr" description
{ "xrayay" } [ "xray" translate ] unit-test

"y is treated like a consonant at the beginning of a word" description
{ "ellowyay" } [ "yellow" translate ] unit-test

"y is treated like a vowel at the end of a consonant cluster" description
{ "ythmrhay" } [ "rhythm" translate ] unit-test

"y as second letter in two letter word" description
{ "ymay" } [ "my" translate ] unit-test

"a whole phrase" description
{ "ickquay astfay unray" } [ "quick fast run" translate ] unit-test
