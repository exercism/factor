USING: clock exercism-tools io kernel tools.test unicode ;
IN: clock.tests

"on the hour" description
{ "08:00" } [ 8 0 <clock> ] unit-test

STOP-HERE

"past the hour" description
{ "11:09" } [ 11 9 <clock> ] unit-test

"midnight is zero hours" description
{ "00:00" } [ 24 0 <clock> ] unit-test

"hour rolls over" description
{ "01:00" } [ 25 0 <clock> ] unit-test

"hour rolls over continuously" description
{ "04:00" } [ 100 0 <clock> ] unit-test

"sixty minutes is next hour" description
{ "02:00" } [ 1 60 <clock> ] unit-test

"minutes roll over" description
{ "02:40" } [ 0 160 <clock> ] unit-test

"minutes roll over continuously" description
{ "04:43" } [ 0 1723 <clock> ] unit-test

"hour and minutes roll over" description
{ "03:40" } [ 25 160 <clock> ] unit-test

"hour and minutes roll over continuously" description
{ "11:01" } [ 201 3001 <clock> ] unit-test

"hour and minutes roll over to exactly midnight" description
{ "00:00" } [ 72 8640 <clock> ] unit-test

"negative hour" description
{ "23:15" } [ -1 15 <clock> ] unit-test

"negative hour rolls over" description
{ "23:00" } [ -25 0 <clock> ] unit-test

"negative hour rolls over continuously" description
{ "05:00" } [ -91 0 <clock> ] unit-test

"negative minutes" description
{ "00:20" } [ 1 -40 <clock> ] unit-test

"negative minutes roll over" description
{ "22:20" } [ 1 -160 <clock> ] unit-test

"negative minutes roll over continuously" description
{ "16:40" } [ 1 -4820 <clock> ] unit-test

"negative sixty minutes is previous hour" description
{ "01:00" } [ 2 -60 <clock> ] unit-test

"negative hour and minutes both roll over" description
{ "20:20" } [ -25 -160 <clock> ] unit-test

"negative hour and minutes both roll over continuously" description
{ "22:10" } [ -121 -5810 <clock> ] unit-test

"add minutes" description
{ "10:03" } [ 10 0 <clock> 3 add-minutes ] unit-test

"add no minutes" description
{ "06:41" } [ 6 41 <clock> 0 add-minutes ] unit-test

"add to next hour" description
{ "01:25" } [ 0 45 <clock> 40 add-minutes ] unit-test

"add more than one hour" description
{ "11:01" } [ 10 0 <clock> 61 add-minutes ] unit-test

"add more than two hours with carry" description
{ "03:25" } [ 0 45 <clock> 160 add-minutes ] unit-test

"add across midnight" description
{ "00:01" } [ 23 59 <clock> 2 add-minutes ] unit-test

"add more than one day (1500 min = 25 hrs)" description
{ "06:32" } [ 5 32 <clock> 1500 add-minutes ] unit-test

"add more than two days" description
{ "11:21" } [ 1 1 <clock> 3500 add-minutes ] unit-test

"subtract minutes" description
{ "10:00" } [ 10 3 <clock> 3 subtract-minutes ] unit-test

"subtract to previous hour" description
{ "09:33" } [ 10 3 <clock> 30 subtract-minutes ] unit-test

"subtract more than an hour" description
{ "08:53" } [ 10 3 <clock> 70 subtract-minutes ] unit-test

"subtract across midnight" description
{ "23:59" } [ 0 3 <clock> 4 subtract-minutes ] unit-test

"subtract more than two hours" description
{ "21:20" } [ 0 0 <clock> 160 subtract-minutes ] unit-test

"subtract more than two hours with borrow" description
{ "03:35" } [ 6 15 <clock> 160 subtract-minutes ] unit-test

"subtract more than one day (1500 min = 25 hrs)" description
{ "04:32" } [ 5 32 <clock> 1500 subtract-minutes ] unit-test

"subtract more than two days" description
{ "00:20" } [ 2 20 <clock> 3000 subtract-minutes ] unit-test

"clocks with same time" description
{ t } [ 15 37 <clock> 15 37 <clock> clock= ] unit-test

"clocks a minute apart" description
{ f } [ 15 36 <clock> 15 37 <clock> clock= ] unit-test

"clocks an hour apart" description
{ f } [ 14 37 <clock> 15 37 <clock> clock= ] unit-test

"clocks with hour overflow" description
{ t } [ 10 37 <clock> 34 37 <clock> clock= ] unit-test

"clocks with hour overflow by several days" description
{ t } [ 3 11 <clock> 99 11 <clock> clock= ] unit-test

"clocks with negative hour" description
{ t } [ 22 40 <clock> -2 40 <clock> clock= ] unit-test

"clocks with negative hour that wraps" description
{ t } [ 17 3 <clock> -31 3 <clock> clock= ] unit-test

"clocks with negative hour that wraps multiple times" description
{ t } [ 13 49 <clock> -83 49 <clock> clock= ] unit-test

"clocks with minute overflow" description
{ t } [ 0 1 <clock> 0 1441 <clock> clock= ] unit-test

"clocks with minute overflow by several days" description
{ t } [ 2 2 <clock> 2 4322 <clock> clock= ] unit-test

"clocks with negative minute" description
{ t } [ 2 40 <clock> 3 -20 <clock> clock= ] unit-test

"clocks with negative minute that wraps" description
{ t } [ 4 10 <clock> 5 -1490 <clock> clock= ] unit-test

"clocks with negative minute that wraps multiple times" description
{ t } [ 6 15 <clock> 6 -4305 <clock> clock= ] unit-test

"clocks with negative hours and minutes" description
{ t } [ 7 32 <clock> -12 -268 <clock> clock= ] unit-test

"clocks with negative hours and minutes that wrap" description
{ t } [ 18 7 <clock> -54 -11513 <clock> clock= ] unit-test

"full clock and zeroed clock" description
{ t } [ 24 0 <clock> 0 0 <clock> clock= ] unit-test
