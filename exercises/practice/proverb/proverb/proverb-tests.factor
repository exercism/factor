USING: exercism-tools io kernel proverb tools.test unicode ;
IN: proverb.tests

"zero pieces" description
{ {  } }
[ {  } recite ] unit-test

STOP-HERE

"one piece" description
{ { "And all for the want of a nail." } }
[ { "nail" } recite ] unit-test

"two pieces" description
{ { "For want of a nail the shoe was lost." "And all for the want of a nail." } }
[ { "nail" "shoe" } recite ] unit-test

"three pieces" description
{ { "For want of a nail the shoe was lost." "For want of a shoe the horse was lost." "And all for the want of a nail." } }
[ { "nail" "shoe" "horse" } recite ] unit-test

"full proverb" description
{ { "For want of a nail the shoe was lost." "For want of a shoe the horse was lost." "For want of a horse the rider was lost." "For want of a rider the message was lost." "For want of a message the battle was lost." "For want of a battle the kingdom was lost." "And all for the want of a nail." } }
[ { "nail" "shoe" "horse" "rider" "message" "battle" "kingdom" } recite ] unit-test

"four pieces modernized" description
{ { "For want of a pin the gun was lost." "For want of a gun the soldier was lost." "For want of a soldier the battle was lost." "And all for the want of a pin." } }
[ { "pin" "gun" "soldier" "battle" } recite ] unit-test
