USING: acronym io kernel lexer tools.test unicode ;
IN: acronym.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Acronym:" print

"basic" print
{ "PNG" }
[ "Portable Network Graphics" abbreviate ] unit-test

STOP-HERE

"lowercase words" print
{ "ROR" }
[ "Ruby on Rails" abbreviate ] unit-test

"punctuation" print
{ "FIFO" }
[ "First In, First Out" abbreviate ] unit-test

"all caps word" print
{ "GIMP" }
[ "GNU Image Manipulation Program" abbreviate ] unit-test

"punctuation without whitespace" print
{ "CMOS" }
[ "Complementary metal-oxide semiconductor" abbreviate ] unit-test

"very long abbreviation" print
{ "ROTFLSHTMDCOALM" }
[ "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me" abbreviate ] unit-test

"consecutive delimiters" print
{ "SIMUFTA" }
[ "Something - I made up from thin air" abbreviate ] unit-test

"apostrophes" print
{ "HC" }
[ "Halley's Comet" abbreviate ] unit-test

"underscore emphasis" print
{ "TRNT" }
[ "The Road _Not_ Taken" abbreviate ] unit-test
