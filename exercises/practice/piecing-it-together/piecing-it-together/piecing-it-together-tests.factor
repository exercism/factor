USING: assocs exercism-tools io kernel piecing-it-together tools.test unicode ;
IN: piecing-it-together.tests

"1000 pieces puzzle with 1.6 aspect ratio" description
{ H{ { "pieces" 1000 } { "border" 126 } { "inside" 874 } { "rows" 25 } { "columns" 40 } { "aspectRatio" 1.6 } { "format" "landscape" } } }
[ H{ { "pieces" 1000 } { "aspectRatio" 1.6 } } jigsaw-data ] unit-test

STOP-HERE

"square puzzle with 32 rows" description
{ H{ { "pieces" 1024 } { "border" 124 } { "inside" 900 } { "rows" 32 } { "columns" 32 } { "aspectRatio" 1.0 } { "format" "square" } } }
[ H{ { "rows" 32 } { "format" "square" } } jigsaw-data ] unit-test

"400 pieces square puzzle with only inside pieces and aspect ratio" description
{ H{ { "pieces" 400 } { "border" 76 } { "inside" 324 } { "rows" 20 } { "columns" 20 } { "aspectRatio" 1.0 } { "format" "square" } } }
[ H{ { "inside" 324 } { "aspectRatio" 1.0 } } jigsaw-data ] unit-test

"1500 pieces landscape puzzle with 30 rows and 1.6 aspect ratio" description
{ H{ { "pieces" 1500 } { "border" 156 } { "inside" 1344 } { "rows" 30 } { "columns" 50 } { "aspectRatio" 1.6666666666666667 } { "format" "landscape" } } }
[ H{ { "rows" 30 } { "aspectRatio" 1.6666666666666667 } } jigsaw-data ] unit-test

"300 pieces portrait puzzle with 70 border pieces" description
{ H{ { "pieces" 300 } { "border" 70 } { "inside" 230 } { "rows" 25 } { "columns" 12 } { "aspectRatio" 0.48 } { "format" "portrait" } } }
[ H{ { "pieces" 300 } { "border" 70 } { "format" "portrait" } } jigsaw-data ] unit-test

"puzzle with insufficient data" description
[ H{ { "pieces" 1500 } { "format" "landscape" } } jigsaw-data ] [ "Insufficient data" = ] must-fail-with

"puzzle with contradictory data" description
[ H{ { "rows" 100 } { "columns" 1000 } { "format" "square" } } jigsaw-data ] [ "Contradictory data" = ] must-fail-with
