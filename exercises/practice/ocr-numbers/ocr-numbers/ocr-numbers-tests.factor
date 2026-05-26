USING: exercism-tools io kernel ocr-numbers tools.test unicode ;
IN: ocr-numbers.tests

"Recognizes 0" description
{ "0" }
[ { " _ " "| |" "|_|" "   " } convert ] unit-test

STOP-HERE

"Recognizes 1" description
{ "1" }
[ { "   " "  |" "  |" "   " } convert ] unit-test

"Unreadable but correctly sized inputs return ?" description
{ "?" }
[ { "   " "  _" "  |" "   " } convert ] unit-test

"Input with a number of lines that is not a multiple of four raises an error" description
[ { " _ " "| |" "   " } convert ]
[ "Number of input lines is not a multiple of four" = ] must-fail-with

"Input with a number of columns that is not a multiple of three raises an error" description
[ { "    " "   |" "   |" "    " } convert ]
[ "Number of input columns is not a multiple of three" = ] must-fail-with

"Recognizes 110101100" description
{ "110101100" }
[ { "       _     _        _  _ " "  |  || |  || |  |  || || |" "  |  ||_|  ||_|  |  ||_||_|" "                           " } convert ] unit-test

"Garbled numbers in a string are replaced with ?" description
{ "11?10?1?0" }
[ { "       _     _           _ " "  |  || |  || |     || || |" "  |  | _|  ||_|  |  ||_||_|" "                           " } convert ] unit-test

"Recognizes 2" description
{ "2" }
[ { " _ " " _|" "|_ " "   " } convert ] unit-test

"Recognizes 3" description
{ "3" }
[ { " _ " " _|" " _|" "   " } convert ] unit-test

"Recognizes 4" description
{ "4" }
[ { "   " "|_|" "  |" "   " } convert ] unit-test

"Recognizes 5" description
{ "5" }
[ { " _ " "|_ " " _|" "   " } convert ] unit-test

"Recognizes 6" description
{ "6" }
[ { " _ " "|_ " "|_|" "   " } convert ] unit-test

"Recognizes 7" description
{ "7" }
[ { " _ " "  |" "  |" "   " } convert ] unit-test

"Recognizes 8" description
{ "8" }
[ { " _ " "|_|" "|_|" "   " } convert ] unit-test

"Recognizes 9" description
{ "9" }
[ { " _ " "|_|" " _|" "   " } convert ] unit-test

"Recognizes string of decimal numbers" description
{ "1234567890" }
[ { "    _  _     _  _  _  _  _  _ " "  | _| _||_||_ |_   ||_||_|| |" "  ||_  _|  | _||_|  ||_| _||_|" "                              " } convert ] unit-test

"Numbers separated by empty lines are recognized. Lines are joined by commas." description
{ "123,456,789" }
[ { "    _  _ " "  | _| _|" "  ||_  _|" "         " "    _  _ " "|_||_ |_ " "  | _||_|" "         " " _  _  _ " "  ||_||_|" "  ||_| _|" "         " } convert ] unit-test
