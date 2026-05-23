USING: exercism-tools kernel sequences signalers-satchel strings
       tools.test ;
IN: signalers-satchel.tests

TASK: 1 quote-value
{ "123" } [ 123 quote-value ] unit-test

STOP-HERE

{ "\"hi\"" } [ "hi" quote-value ] unit-test
{ "{ 1 2 3 }" } [ { 1 2 3 } quote-value ] unit-test
{ "f" } [ f quote-value ] unit-test

TASK: 2 flag-body
{ "NS-1024" } [ "#NS-1024#" flag-body >string ] unit-test
{ "WB-203" }  [ "#WB-203#"  flag-body >string ] unit-test
{ "" }        [ "##"        flag-body >string ] unit-test

TASK: 3 split-flag
{ "NS" "-1024" } [ "NS-1024" 2 split-flag [ >string ] bi@ ] unit-test
{ "WB" "-203"  } [ "WB-203"  2 split-flag [ >string ] bi@ ] unit-test
{ "" "AC-77"   } [ "AC-77"   0 split-flag [ >string ] bi@ ] unit-test

TASK: 4 triangulate
{ 50 75 2 } [ 100 50 triangulate ] unit-test
{ 40 40 3 } [ 60 20 triangulate ] unit-test
{ 0 5 1 }   [ 5 5 triangulate ] unit-test

TASK: 5 triangle-stats
{ 16 120 8 }  [ 5 3 8 triangle-stats ] unit-test
{ 9 24 4 }    [ 2 3 4 triangle-stats ] unit-test
{ 30 1000 10 } [ 10 10 10 triangle-stats ] unit-test
