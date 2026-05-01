USING: exercism-tools io kernel ocr-numbers tools.test unicode ;
IN: ocr-numbers.tests

"Ocr Numbers:" print

"Recognizes 0" print
{ "0" }
[ { " _ " "| |" "|_|" "   " } convert ] unit-test

STOP-HERE

"Recognizes 1" print
{ "1" }
[ { "   " "  |" "  |" "   " } convert ] unit-test

"Unreadable but correctly sized inputs return ?" print
{ "?" }
[ { "   " "  _" "  |" "   " } convert ] unit-test

"Input with a number of lines that is not a multiple of four raises an error" print
[ { " _ " "| |" "   " } convert ]
[ "Number of input lines is not a multiple of four" = ] must-fail-with

"Input with a number of columns that is not a multiple of three raises an error" print
[ { "    " "   |" "   |" "    " } convert ]
[ "Number of input columns is not a multiple of three" = ] must-fail-with

"Recognizes 110101100" print
{ "110101100" }
[ { "       _     _        _  _ " "  |  || |  || |  |  || || |" "  |  ||_|  ||_|  |  ||_||_|" "                           " } convert ] unit-test

"Garbled numbers in a string are replaced with ?" print
{ "11?10?1?0" }
[ { "       _     _           _ " "  |  || |  || |     || || |" "  |  | _|  ||_|  |  ||_||_|" "                           " } convert ] unit-test

"Recognizes 2" print
{ "2" }
[ { " _ " " _|" "|_ " "   " } convert ] unit-test

"Recognizes 3" print
{ "3" }
[ { " _ " " _|" " _|" "   " } convert ] unit-test

"Recognizes 4" print
{ "4" }
[ { "   " "|_|" "  |" "   " } convert ] unit-test

"Recognizes 5" print
{ "5" }
[ { " _ " "|_ " " _|" "   " } convert ] unit-test

"Recognizes 6" print
{ "6" }
[ { " _ " "|_ " "|_|" "   " } convert ] unit-test

"Recognizes 7" print
{ "7" }
[ { " _ " "  |" "  |" "   " } convert ] unit-test

"Recognizes 8" print
{ "8" }
[ { " _ " "|_|" "|_|" "   " } convert ] unit-test

"Recognizes 9" print
{ "9" }
[ { " _ " "|_|" " _|" "   " } convert ] unit-test

"Recognizes string of decimal numbers" print
{ "1234567890" }
[ { "    _  _     _  _  _  _  _  _ " "  | _| _||_||_ |_   ||_||_|| |" "  ||_  _|  | _||_|  ||_| _||_|" "                              " } convert ] unit-test

"Numbers separated by empty lines are recognized. Lines are joined by commas." print
{ "123,456,789" }
[ { "    _  _ " "  | _| _|" "  ||_  _|" "         " "    _  _ " "|_||_ |_ " "  | _||_|" "         " " _  _  _ " "  ||_||_|" "  ||_| _|" "         " } convert ] unit-test
