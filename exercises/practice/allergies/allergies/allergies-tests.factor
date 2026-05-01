USING: allergies exercism-tools io kernel tools.test unicode ;
IN: allergies.tests

"Allergies:" print

"not allergic to anything" print
{ f }
[ 0 "eggs" allergic-to ] unit-test

STOP-HERE

"allergic only to eggs" print
{ t }
[ 1 "eggs" allergic-to ] unit-test

"allergic to eggs and something else" print
{ t }
[ 3 "eggs" allergic-to ] unit-test

"allergic to something, but not eggs" print
{ f }
[ 2 "eggs" allergic-to ] unit-test

"allergic to everything" print
{ t }
[ 255 "eggs" allergic-to ] unit-test

"not allergic to anything" print
{ f }
[ 0 "peanuts" allergic-to ] unit-test

"allergic only to peanuts" print
{ t }
[ 2 "peanuts" allergic-to ] unit-test

"allergic to peanuts and something else" print
{ t }
[ 7 "peanuts" allergic-to ] unit-test

"allergic to something, but not peanuts" print
{ f }
[ 5 "peanuts" allergic-to ] unit-test

"allergic to everything" print
{ t }
[ 255 "peanuts" allergic-to ] unit-test

"not allergic to anything" print
{ f }
[ 0 "shellfish" allergic-to ] unit-test

"allergic only to shellfish" print
{ t }
[ 4 "shellfish" allergic-to ] unit-test

"allergic to shellfish and something else" print
{ t }
[ 14 "shellfish" allergic-to ] unit-test

"allergic to something, but not shellfish" print
{ f }
[ 10 "shellfish" allergic-to ] unit-test

"allergic to everything" print
{ t }
[ 255 "shellfish" allergic-to ] unit-test

"not allergic to anything" print
{ f }
[ 0 "strawberries" allergic-to ] unit-test

"allergic only to strawberries" print
{ t }
[ 8 "strawberries" allergic-to ] unit-test

"allergic to strawberries and something else" print
{ t }
[ 28 "strawberries" allergic-to ] unit-test

"allergic to something, but not strawberries" print
{ f }
[ 20 "strawberries" allergic-to ] unit-test

"allergic to everything" print
{ t }
[ 255 "strawberries" allergic-to ] unit-test

"not allergic to anything" print
{ f }
[ 0 "tomatoes" allergic-to ] unit-test

"allergic only to tomatoes" print
{ t }
[ 16 "tomatoes" allergic-to ] unit-test

"allergic to tomatoes and something else" print
{ t }
[ 56 "tomatoes" allergic-to ] unit-test

"allergic to something, but not tomatoes" print
{ f }
[ 40 "tomatoes" allergic-to ] unit-test

"allergic to everything" print
{ t }
[ 255 "tomatoes" allergic-to ] unit-test

"not allergic to anything" print
{ f }
[ 0 "chocolate" allergic-to ] unit-test

"allergic only to chocolate" print
{ t }
[ 32 "chocolate" allergic-to ] unit-test

"allergic to chocolate and something else" print
{ t }
[ 112 "chocolate" allergic-to ] unit-test

"allergic to something, but not chocolate" print
{ f }
[ 80 "chocolate" allergic-to ] unit-test

"allergic to everything" print
{ t }
[ 255 "chocolate" allergic-to ] unit-test

"not allergic to anything" print
{ f }
[ 0 "pollen" allergic-to ] unit-test

"allergic only to pollen" print
{ t }
[ 64 "pollen" allergic-to ] unit-test

"allergic to pollen and something else" print
{ t }
[ 224 "pollen" allergic-to ] unit-test

"allergic to something, but not pollen" print
{ f }
[ 160 "pollen" allergic-to ] unit-test

"allergic to everything" print
{ t }
[ 255 "pollen" allergic-to ] unit-test

"not allergic to anything" print
{ f }
[ 0 "cats" allergic-to ] unit-test

"allergic only to cats" print
{ t }
[ 128 "cats" allergic-to ] unit-test

"allergic to cats and something else" print
{ t }
[ 192 "cats" allergic-to ] unit-test

"allergic to something, but not cats" print
{ f }
[ 64 "cats" allergic-to ] unit-test

"allergic to everything" print
{ t }
[ 255 "cats" allergic-to ] unit-test

"no allergies" print
{ HS{ } }
[ 0 allergens ] unit-test

"just eggs" print
{ HS{ "eggs" } }
[ 1 allergens ] unit-test

"just peanuts" print
{ HS{ "peanuts" } }
[ 2 allergens ] unit-test

"just strawberries" print
{ HS{ "strawberries" } }
[ 8 allergens ] unit-test

"eggs and peanuts" print
{ HS{ "eggs" "peanuts" } }
[ 3 allergens ] unit-test

"more than eggs but not peanuts" print
{ HS{ "eggs" "shellfish" } }
[ 5 allergens ] unit-test

"lots of stuff" print
{ HS{ "strawberries" "tomatoes" "chocolate" "pollen" "cats" } }
[ 248 allergens ] unit-test

"everything" print
{ HS{ "eggs" "peanuts" "shellfish" "strawberries" "tomatoes" "chocolate" "pollen" "cats" } }
[ 255 allergens ] unit-test

"no allergen score parts" print
{ HS{ "eggs" "shellfish" "strawberries" "tomatoes" "chocolate" "pollen" "cats" } }
[ 509 allergens ] unit-test

"no allergen score parts without highest valid score" print
{ HS{ "eggs" } }
[ 257 allergens ] unit-test
