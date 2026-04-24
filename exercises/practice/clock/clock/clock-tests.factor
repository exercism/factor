USING: clock io kernel lexer tools.test unicode ;
IN: clock.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Clock:" print

"on the hour" print
{ "08:00" } [ 8 0 <clock> ] unit-test

STOP-HERE

"past the hour" print
{ "11:09" } [ 11 9 <clock> ] unit-test

"midnight is zero hours" print
{ "00:00" } [ 24 0 <clock> ] unit-test

"hour rolls over" print
{ "01:00" } [ 25 0 <clock> ] unit-test

"hour rolls over continuously" print
{ "04:00" } [ 100 0 <clock> ] unit-test

"sixty minutes is next hour" print
{ "02:00" } [ 1 60 <clock> ] unit-test

"minutes roll over" print
{ "02:40" } [ 0 160 <clock> ] unit-test

"minutes roll over continuously" print
{ "04:43" } [ 0 1723 <clock> ] unit-test

"hour and minutes roll over" print
{ "03:40" } [ 25 160 <clock> ] unit-test

"hour and minutes roll over continuously" print
{ "11:01" } [ 201 3001 <clock> ] unit-test

"hour and minutes roll over to exactly midnight" print
{ "00:00" } [ 72 8640 <clock> ] unit-test

"negative hour" print
{ "23:15" } [ -1 15 <clock> ] unit-test

"negative hour rolls over" print
{ "23:00" } [ -25 0 <clock> ] unit-test

"negative hour rolls over continuously" print
{ "05:00" } [ -91 0 <clock> ] unit-test

"negative minutes" print
{ "00:20" } [ 1 -40 <clock> ] unit-test

"negative minutes roll over" print
{ "22:20" } [ 1 -160 <clock> ] unit-test

"negative minutes roll over continuously" print
{ "16:40" } [ 1 -4820 <clock> ] unit-test

"negative sixty minutes is previous hour" print
{ "01:00" } [ 2 -60 <clock> ] unit-test

"negative hour and minutes both roll over" print
{ "20:20" } [ -25 -160 <clock> ] unit-test

"negative hour and minutes both roll over continuously" print
{ "22:10" } [ -121 -5810 <clock> ] unit-test

"add minutes" print
{ "10:03" } [ 10 0 <clock> 3 add-minutes ] unit-test

"add no minutes" print
{ "06:41" } [ 6 41 <clock> 0 add-minutes ] unit-test

"add to next hour" print
{ "01:25" } [ 0 45 <clock> 40 add-minutes ] unit-test

"add more than one hour" print
{ "11:01" } [ 10 0 <clock> 61 add-minutes ] unit-test

"add more than two hours with carry" print
{ "03:25" } [ 0 45 <clock> 160 add-minutes ] unit-test

"add across midnight" print
{ "00:01" } [ 23 59 <clock> 2 add-minutes ] unit-test

"add more than one day (1500 min = 25 hrs)" print
{ "06:32" } [ 5 32 <clock> 1500 add-minutes ] unit-test

"add more than two days" print
{ "11:21" } [ 1 1 <clock> 3500 add-minutes ] unit-test

"subtract minutes" print
{ "10:00" } [ 10 3 <clock> 3 subtract-minutes ] unit-test

"subtract to previous hour" print
{ "09:33" } [ 10 3 <clock> 30 subtract-minutes ] unit-test

"subtract more than an hour" print
{ "08:53" } [ 10 3 <clock> 70 subtract-minutes ] unit-test

"subtract across midnight" print
{ "23:59" } [ 0 3 <clock> 4 subtract-minutes ] unit-test

"subtract more than two hours" print
{ "21:20" } [ 0 0 <clock> 160 subtract-minutes ] unit-test

"subtract more than two hours with borrow" print
{ "03:35" } [ 6 15 <clock> 160 subtract-minutes ] unit-test

"subtract more than one day (1500 min = 25 hrs)" print
{ "04:32" } [ 5 32 <clock> 1500 subtract-minutes ] unit-test

"subtract more than two days" print
{ "00:20" } [ 2 20 <clock> 3000 subtract-minutes ] unit-test

"clocks with same time" print
{ t } [ 15 37 <clock> 15 37 <clock> clock= ] unit-test

"clocks a minute apart" print
{ f } [ 15 36 <clock> 15 37 <clock> clock= ] unit-test

"clocks an hour apart" print
{ f } [ 14 37 <clock> 15 37 <clock> clock= ] unit-test

"clocks with hour overflow" print
{ t } [ 10 37 <clock> 34 37 <clock> clock= ] unit-test

"clocks with hour overflow by several days" print
{ t } [ 3 11 <clock> 99 11 <clock> clock= ] unit-test

"clocks with negative hour" print
{ t } [ 22 40 <clock> -2 40 <clock> clock= ] unit-test

"clocks with negative hour that wraps" print
{ t } [ 17 3 <clock> -31 3 <clock> clock= ] unit-test

"clocks with negative hour that wraps multiple times" print
{ t } [ 13 49 <clock> -83 49 <clock> clock= ] unit-test

"clocks with minute overflow" print
{ t } [ 0 1 <clock> 0 1441 <clock> clock= ] unit-test

"clocks with minute overflow by several days" print
{ t } [ 2 2 <clock> 2 4322 <clock> clock= ] unit-test

"clocks with negative minute" print
{ t } [ 2 40 <clock> 3 -20 <clock> clock= ] unit-test

"clocks with negative minute that wraps" print
{ t } [ 4 10 <clock> 5 -1490 <clock> clock= ] unit-test

"clocks with negative minute that wraps multiple times" print
{ t } [ 6 15 <clock> 6 -4305 <clock> clock= ] unit-test

"clocks with negative hours and minutes" print
{ t } [ 7 32 <clock> -12 -268 <clock> clock= ] unit-test

"clocks with negative hours and minutes that wrap" print
{ t } [ 18 7 <clock> -54 -11513 <clock> clock= ] unit-test

"full clock and zeroed clock" print
{ t } [ 24 0 <clock> 0 0 <clock> clock= ] unit-test
