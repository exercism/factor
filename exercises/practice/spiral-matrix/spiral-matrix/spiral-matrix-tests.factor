USING: exercism-tools io kernel spiral-matrix tools.test unicode ;
IN: spiral-matrix.tests

"empty spiral" description
{ { } }
[ 0 spiral-matrix ] unit-test

STOP-HERE

"trivial spiral" description
{
    {
        { 1 }
    }
}
[ 1 spiral-matrix ] unit-test

"spiral of size 2" description
{
    {
        { 1 2 }
        { 4 3 }
    }
}
[ 2 spiral-matrix ] unit-test

"spiral of size 3" description
{
    {
        { 1 2 3 }
        { 8 9 4 }
        { 7 6 5 }
    }
}
[ 3 spiral-matrix ] unit-test

"spiral of size 4" description
{
    {
        { 1 2 3 4 }
        { 12 13 14 5 }
        { 11 16 15 6 }
        { 10 9 8 7 }
    }
}
[ 4 spiral-matrix ] unit-test

"spiral of size 5" description
{
    {
        { 1 2 3 4 5 }
        { 16 17 18 19 6 }
        { 15 24 25 20 7 }
        { 14 23 22 21 8 }
        { 13 12 11 10 9 }
    }
}
[ 5 spiral-matrix ] unit-test
