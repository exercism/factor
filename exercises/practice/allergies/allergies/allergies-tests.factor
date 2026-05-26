USING: allergies exercism-tools io kernel tools.test unicode ;
IN: allergies.tests

"not allergic to anything" description
{ f }
[ 0 "eggs" allergic-to ] unit-test

STOP-HERE

"allergic only to eggs" description
{ t }
[ 1 "eggs" allergic-to ] unit-test

"allergic to eggs and something else" description
{ t }
[ 3 "eggs" allergic-to ] unit-test

"allergic to something, but not eggs" description
{ f }
[ 2 "eggs" allergic-to ] unit-test

"allergic to everything" description
{ t }
[ 255 "eggs" allergic-to ] unit-test

"not allergic to anything" description
{ f }
[ 0 "peanuts" allergic-to ] unit-test

"allergic only to peanuts" description
{ t }
[ 2 "peanuts" allergic-to ] unit-test

"allergic to peanuts and something else" description
{ t }
[ 7 "peanuts" allergic-to ] unit-test

"allergic to something, but not peanuts" description
{ f }
[ 5 "peanuts" allergic-to ] unit-test

"allergic to everything" description
{ t }
[ 255 "peanuts" allergic-to ] unit-test

"not allergic to anything" description
{ f }
[ 0 "shellfish" allergic-to ] unit-test

"allergic only to shellfish" description
{ t }
[ 4 "shellfish" allergic-to ] unit-test

"allergic to shellfish and something else" description
{ t }
[ 14 "shellfish" allergic-to ] unit-test

"allergic to something, but not shellfish" description
{ f }
[ 10 "shellfish" allergic-to ] unit-test

"allergic to everything" description
{ t }
[ 255 "shellfish" allergic-to ] unit-test

"not allergic to anything" description
{ f }
[ 0 "strawberries" allergic-to ] unit-test

"allergic only to strawberries" description
{ t }
[ 8 "strawberries" allergic-to ] unit-test

"allergic to strawberries and something else" description
{ t }
[ 28 "strawberries" allergic-to ] unit-test

"allergic to something, but not strawberries" description
{ f }
[ 20 "strawberries" allergic-to ] unit-test

"allergic to everything" description
{ t }
[ 255 "strawberries" allergic-to ] unit-test

"not allergic to anything" description
{ f }
[ 0 "tomatoes" allergic-to ] unit-test

"allergic only to tomatoes" description
{ t }
[ 16 "tomatoes" allergic-to ] unit-test

"allergic to tomatoes and something else" description
{ t }
[ 56 "tomatoes" allergic-to ] unit-test

"allergic to something, but not tomatoes" description
{ f }
[ 40 "tomatoes" allergic-to ] unit-test

"allergic to everything" description
{ t }
[ 255 "tomatoes" allergic-to ] unit-test

"not allergic to anything" description
{ f }
[ 0 "chocolate" allergic-to ] unit-test

"allergic only to chocolate" description
{ t }
[ 32 "chocolate" allergic-to ] unit-test

"allergic to chocolate and something else" description
{ t }
[ 112 "chocolate" allergic-to ] unit-test

"allergic to something, but not chocolate" description
{ f }
[ 80 "chocolate" allergic-to ] unit-test

"allergic to everything" description
{ t }
[ 255 "chocolate" allergic-to ] unit-test

"not allergic to anything" description
{ f }
[ 0 "pollen" allergic-to ] unit-test

"allergic only to pollen" description
{ t }
[ 64 "pollen" allergic-to ] unit-test

"allergic to pollen and something else" description
{ t }
[ 224 "pollen" allergic-to ] unit-test

"allergic to something, but not pollen" description
{ f }
[ 160 "pollen" allergic-to ] unit-test

"allergic to everything" description
{ t }
[ 255 "pollen" allergic-to ] unit-test

"not allergic to anything" description
{ f }
[ 0 "cats" allergic-to ] unit-test

"allergic only to cats" description
{ t }
[ 128 "cats" allergic-to ] unit-test

"allergic to cats and something else" description
{ t }
[ 192 "cats" allergic-to ] unit-test

"allergic to something, but not cats" description
{ f }
[ 64 "cats" allergic-to ] unit-test

"allergic to everything" description
{ t }
[ 255 "cats" allergic-to ] unit-test

"no allergies" description
{ HS{ } }
[ 0 allergens ] unit-test

"just eggs" description
{ HS{ "eggs" } }
[ 1 allergens ] unit-test

"just peanuts" description
{ HS{ "peanuts" } }
[ 2 allergens ] unit-test

"just strawberries" description
{ HS{ "strawberries" } }
[ 8 allergens ] unit-test

"eggs and peanuts" description
{ HS{ "eggs" "peanuts" } }
[ 3 allergens ] unit-test

"more than eggs but not peanuts" description
{ HS{ "eggs" "shellfish" } }
[ 5 allergens ] unit-test

"lots of stuff" description
{ HS{ "strawberries" "tomatoes" "chocolate" "pollen" "cats" } }
[ 248 allergens ] unit-test

"everything" description
{ HS{ "eggs" "peanuts" "shellfish" "strawberries" "tomatoes" "chocolate" "pollen" "cats" } }
[ 255 allergens ] unit-test

"no allergen score parts" description
{ HS{ "eggs" "shellfish" "strawberries" "tomatoes" "chocolate" "pollen" "cats" } }
[ 509 allergens ] unit-test

"no allergen score parts without highest valid score" description
{ HS{ "eggs" } }
[ 257 allergens ] unit-test
