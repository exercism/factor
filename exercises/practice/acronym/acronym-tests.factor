USING: acronym io kernel math sequences tools.test unicode ;
IN: acronym.tests

"Acronym:" print

"basic" print
{ "PNG" } [ "Portable Network Graphics" acronym ] unit-test

"lowercase words" print
{ "ROR" } [ "Ruby on Rails" acronym ] unit-test

"punctuation" print
{ "FIFO" } [ "First In, First Out" acronym ] unit-test

"all caps word" print
{ "GIMP" } [ "GNU Image Manipulation Program" acronym ] unit-test

"punctuation without whitespace" print
{ "CMOS" } [ "Complementary metal-oxide semiconductor" acronym ] unit-test

"very long abbreviation" print
{ "ROTFLSHTMDCOALM" } [
    "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me"
    acronym
] unit-test

"consecutive delimiters" print
{ "SIMUFTA" } [ "Something - I made up from thin air" acronym ] unit-test

"apostrophes" print
{ "HC" } [ "Halley's Comet" acronym ] unit-test

"underscore emphasis" print
{ "TRNT" } [ "The Road _Not_ Taken" acronym ] unit-test

