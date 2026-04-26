USING: boutique-bookkeeping tools.test ;
IN: boutique-bookkeeping.tests

! TASK: 1 sort-by-price
{
    { { "Bamboo Socks Cats" 20 } { "Red Skirt" 50 } { "Black Skirt" 50 } { "Maxi Brown Dress" 65 } }
} [
    { { "Maxi Brown Dress" 65 } { "Red Skirt" 50 } { "Black Skirt" 50 } { "Bamboo Socks Cats" 20 } }
    sort-by-price
] unit-test

! TASK: 2 with-missing-price
{ { { "Denim Pants" f } { "Denim Skirt" f } } } [
    { { "Black T-shirt" 40 } { "Denim Pants" f } { "Denim Skirt" f } { "Orange T-shirt" 40 } }
    with-missing-price
] unit-test

{ { } } [ { { "Black T-shirt" 40 } } with-missing-price ] unit-test

! TASK: 3 expensive-items
{ 2 } [
    { { "Skirt" 50 } { "Coat" 120 } { "Hat" 25 } { "Dress" 80 } }
    expensive-items
] unit-test

{ 0 } [ { { "Hat" 25 } { "Sock" 5 } } expensive-items ] unit-test

! TASK: 4 cheapest-item
{ { "Hat" 25 } } [
    { { "Skirt" 50 } { "Coat" 120 } { "Hat" 25 } } cheapest-item
] unit-test

! TASK: 5 total-price
{ 195 } [
    { { "Skirt" 50 } { "Coat" 120 } { "Hat" 25 } } total-price
] unit-test

{ 0 } [ { } total-price ] unit-test

! TASK: 6 format-price-tag
{ "Skirt: $50" } [ { "Skirt" 50 } format-price-tag ] unit-test
{ "Coat: $120" } [ { "Coat" 120 } format-price-tag ] unit-test
{ "Hat: $25" } [ { "Hat" 25 } format-price-tag ] unit-test
