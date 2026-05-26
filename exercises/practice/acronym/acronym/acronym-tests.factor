USING: acronym exercism-tools io kernel tools.test unicode ;
IN: acronym.tests

"basic" description
{ "PNG" }
[ "Portable Network Graphics" abbreviate ] unit-test

STOP-HERE

"lowercase words" description
{ "ROR" }
[ "Ruby on Rails" abbreviate ] unit-test

"punctuation" description
{ "FIFO" }
[ "First In, First Out" abbreviate ] unit-test

"all caps word" description
{ "GIMP" }
[ "GNU Image Manipulation Program" abbreviate ] unit-test

"punctuation without whitespace" description
{ "CMOS" }
[ "Complementary metal-oxide semiconductor" abbreviate ] unit-test

"very long abbreviation" description
{ "ROTFLSHTMDCOALM" }
[ "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me" abbreviate ] unit-test

"consecutive delimiters" description
{ "SIMUFTA" }
[ "Something - I made up from thin air" abbreviate ] unit-test

"apostrophes" description
{ "HC" }
[ "Halley's Comet" abbreviate ] unit-test

"underscore emphasis" description
{ "TRNT" }
[ "The Road _Not_ Taken" abbreviate ] unit-test
