USING: exercism-tools house io kernel tools.test unicode ;
IN: house.tests

"verse one - the house that jack built" description
{ { "This is the house that Jack built." } }
[ 1 1 recite ] unit-test

STOP-HERE

"verse two - the malt that lay" description
{ { "This is the malt that lay in the house that Jack built." } }
[ 2 2 recite ] unit-test

"verse three - the rat that ate" description
{ { "This is the rat that ate the malt that lay in the house that Jack built." } }
[ 3 3 recite ] unit-test

"verse four - the cat that killed" description
{ { "This is the cat that killed the rat that ate the malt that lay in the house that Jack built." } }
[ 4 4 recite ] unit-test

"verse five - the dog that worried" description
{ { "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built." } }
[ 5 5 recite ] unit-test

"verse six - the cow with the crumpled horn" description
{ { "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built." } }
[ 6 6 recite ] unit-test

"verse seven - the maiden all forlorn" description
{ { "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built." } }
[ 7 7 recite ] unit-test

"verse eight - the man all tattered and torn" description
{ { "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built." } }
[ 8 8 recite ] unit-test

"verse nine - the priest all shaven and shorn" description
{ { "This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built." } }
[ 9 9 recite ] unit-test

"verse 10 - the rooster that crowed in the morn" description
{ { "This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built." } }
[ 10 10 recite ] unit-test

"verse 11 - the farmer sowing his corn" description
{ { "This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built." } }
[ 11 11 recite ] unit-test

"verse 12 - the horse and the hound and the horn" description
{ { "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built." } }
[ 12 12 recite ] unit-test

"multiple verses" description
{ { "This is the cat that killed the rat that ate the malt that lay in the house that Jack built." "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built." "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built." "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built." "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built." } }
[ 4 8 recite ] unit-test

"full rhyme" description
{ { "This is the house that Jack built." "This is the malt that lay in the house that Jack built." "This is the rat that ate the malt that lay in the house that Jack built." "This is the cat that killed the rat that ate the malt that lay in the house that Jack built." "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built." "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built." "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built." "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built." "This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built." "This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built." "This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built." "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built." } }
[ 1 12 recite ] unit-test
