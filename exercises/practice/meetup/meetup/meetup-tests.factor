USING: calendar exercism-tools io kernel meetup tools.test unicode ;
IN: meetup.tests

"when teenth Monday is the 13th, the first day of the teenth week" description
{ t } [ 2013 5 "teenth" "Monday" meetup  2013 5 13 <date> = ] unit-test

STOP-HERE

"when teenth Monday is the 19th, the last day of the teenth week" description
{ t } [ 2013 8 "teenth" "Monday" meetup  2013 8 19 <date> = ] unit-test

"when teenth Monday is some day in the middle of the teenth week" description
{ t } [ 2013 9 "teenth" "Monday" meetup  2013 9 16 <date> = ] unit-test

"when teenth Tuesday is the 19th, the last day of the teenth week" description
{ t } [ 2013 3 "teenth" "Tuesday" meetup  2013 3 19 <date> = ] unit-test

"when teenth Tuesday is some day in the middle of the teenth week" description
{ t } [ 2013 4 "teenth" "Tuesday" meetup  2013 4 16 <date> = ] unit-test

"when teenth Tuesday is the 13th, the first day of the teenth week" description
{ t } [ 2013 8 "teenth" "Tuesday" meetup  2013 8 13 <date> = ] unit-test

"when teenth Wednesday is some day in the middle of the teenth week" description
{ t } [ 2013 1 "teenth" "Wednesday" meetup  2013 1 16 <date> = ] unit-test

"when teenth Wednesday is the 13th, the first day of the teenth week" description
{ t } [ 2013 2 "teenth" "Wednesday" meetup  2013 2 13 <date> = ] unit-test

"when teenth Wednesday is the 19th, the last day of the teenth week" description
{ t } [ 2013 6 "teenth" "Wednesday" meetup  2013 6 19 <date> = ] unit-test

"when teenth Thursday is some day in the middle of the teenth week" description
{ t } [ 2013 5 "teenth" "Thursday" meetup  2013 5 16 <date> = ] unit-test

"when teenth Thursday is the 13th, the first day of the teenth week" description
{ t } [ 2013 6 "teenth" "Thursday" meetup  2013 6 13 <date> = ] unit-test

"when teenth Thursday is the 19th, the last day of the teenth week" description
{ t } [ 2013 9 "teenth" "Thursday" meetup  2013 9 19 <date> = ] unit-test

"when teenth Friday is the 19th, the last day of the teenth week" description
{ t } [ 2013 4 "teenth" "Friday" meetup  2013 4 19 <date> = ] unit-test

"when teenth Friday is some day in the middle of the teenth week" description
{ t } [ 2013 8 "teenth" "Friday" meetup  2013 8 16 <date> = ] unit-test

"when teenth Friday is the 13th, the first day of the teenth week" description
{ t } [ 2013 9 "teenth" "Friday" meetup  2013 9 13 <date> = ] unit-test

"when teenth Saturday is some day in the middle of the teenth week" description
{ t } [ 2013 2 "teenth" "Saturday" meetup  2013 2 16 <date> = ] unit-test

"when teenth Saturday is the 13th, the first day of the teenth week" description
{ t } [ 2013 4 "teenth" "Saturday" meetup  2013 4 13 <date> = ] unit-test

"when teenth Saturday is the 19th, the last day of the teenth week" description
{ t } [ 2013 10 "teenth" "Saturday" meetup  2013 10 19 <date> = ] unit-test

"when teenth Sunday is the 19th, the last day of the teenth week" description
{ t } [ 2013 5 "teenth" "Sunday" meetup  2013 5 19 <date> = ] unit-test

"when teenth Sunday is some day in the middle of the teenth week" description
{ t } [ 2013 6 "teenth" "Sunday" meetup  2013 6 16 <date> = ] unit-test

"when teenth Sunday is the 13th, the first day of the teenth week" description
{ t } [ 2013 10 "teenth" "Sunday" meetup  2013 10 13 <date> = ] unit-test

"when first Monday is some day in the middle of the first week" description
{ t } [ 2013 3 "first" "Monday" meetup  2013 3 4 <date> = ] unit-test

"when first Monday is the 1st, the first day of the first week" description
{ t } [ 2013 4 "first" "Monday" meetup  2013 4 1 <date> = ] unit-test

"when first Tuesday is the 7th, the last day of the first week" description
{ t } [ 2013 5 "first" "Tuesday" meetup  2013 5 7 <date> = ] unit-test

"when first Tuesday is some day in the middle of the first week" description
{ t } [ 2013 6 "first" "Tuesday" meetup  2013 6 4 <date> = ] unit-test

"when first Wednesday is some day in the middle of the first week" description
{ t } [ 2013 7 "first" "Wednesday" meetup  2013 7 3 <date> = ] unit-test

"when first Wednesday is the 7th, the last day of the first week" description
{ t } [ 2013 8 "first" "Wednesday" meetup  2013 8 7 <date> = ] unit-test

"when first Thursday is some day in the middle of the first week" description
{ t } [ 2013 9 "first" "Thursday" meetup  2013 9 5 <date> = ] unit-test

"when first Thursday is another day in the middle of the first week" description
{ t } [ 2013 10 "first" "Thursday" meetup  2013 10 3 <date> = ] unit-test

"when first Friday is the 1st, the first day of the first week" description
{ t } [ 2013 11 "first" "Friday" meetup  2013 11 1 <date> = ] unit-test

"when first Friday is some day in the middle of the first week" description
{ t } [ 2013 12 "first" "Friday" meetup  2013 12 6 <date> = ] unit-test

"when first Saturday is some day in the middle of the first week" description
{ t } [ 2013 1 "first" "Saturday" meetup  2013 1 5 <date> = ] unit-test

"when first Saturday is another day in the middle of the first week" description
{ t } [ 2013 2 "first" "Saturday" meetup  2013 2 2 <date> = ] unit-test

"when first Sunday is some day in the middle of the first week" description
{ t } [ 2013 3 "first" "Sunday" meetup  2013 3 3 <date> = ] unit-test

"when first Sunday is the 7th, the last day of the first week" description
{ t } [ 2013 4 "first" "Sunday" meetup  2013 4 7 <date> = ] unit-test

"when second Monday is some day in the middle of the second week" description
{ t } [ 2013 3 "second" "Monday" meetup  2013 3 11 <date> = ] unit-test

"when second Monday is the 8th, the first day of the second week" description
{ t } [ 2013 4 "second" "Monday" meetup  2013 4 8 <date> = ] unit-test

"when second Tuesday is the 14th, the last day of the second week" description
{ t } [ 2013 5 "second" "Tuesday" meetup  2013 5 14 <date> = ] unit-test

"when second Tuesday is some day in the middle of the second week" description
{ t } [ 2013 6 "second" "Tuesday" meetup  2013 6 11 <date> = ] unit-test

"when second Wednesday is some day in the middle of the second week" description
{ t } [ 2013 7 "second" "Wednesday" meetup  2013 7 10 <date> = ] unit-test

"when second Wednesday is the 14th, the last day of the second week" description
{ t } [ 2013 8 "second" "Wednesday" meetup  2013 8 14 <date> = ] unit-test

"when second Thursday is some day in the middle of the second week" description
{ t } [ 2013 9 "second" "Thursday" meetup  2013 9 12 <date> = ] unit-test

"when second Thursday is another day in the middle of the second week" description
{ t } [ 2013 10 "second" "Thursday" meetup  2013 10 10 <date> = ] unit-test

"when second Friday is the 8th, the first day of the second week" description
{ t } [ 2013 11 "second" "Friday" meetup  2013 11 8 <date> = ] unit-test

"when second Friday is some day in the middle of the second week" description
{ t } [ 2013 12 "second" "Friday" meetup  2013 12 13 <date> = ] unit-test

"when second Saturday is some day in the middle of the second week" description
{ t } [ 2013 1 "second" "Saturday" meetup  2013 1 12 <date> = ] unit-test

"when second Saturday is another day in the middle of the second week" description
{ t } [ 2013 2 "second" "Saturday" meetup  2013 2 9 <date> = ] unit-test

"when second Sunday is some day in the middle of the second week" description
{ t } [ 2013 3 "second" "Sunday" meetup  2013 3 10 <date> = ] unit-test

"when second Sunday is the 14th, the last day of the second week" description
{ t } [ 2013 4 "second" "Sunday" meetup  2013 4 14 <date> = ] unit-test

"when third Monday is some day in the middle of the third week" description
{ t } [ 2013 3 "third" "Monday" meetup  2013 3 18 <date> = ] unit-test

"when third Monday is the 15th, the first day of the third week" description
{ t } [ 2013 4 "third" "Monday" meetup  2013 4 15 <date> = ] unit-test

"when third Tuesday is the 21st, the last day of the third week" description
{ t } [ 2013 5 "third" "Tuesday" meetup  2013 5 21 <date> = ] unit-test

"when third Tuesday is some day in the middle of the third week" description
{ t } [ 2013 6 "third" "Tuesday" meetup  2013 6 18 <date> = ] unit-test

"when third Wednesday is some day in the middle of the third week" description
{ t } [ 2013 7 "third" "Wednesday" meetup  2013 7 17 <date> = ] unit-test

"when third Wednesday is the 21st, the last day of the third week" description
{ t } [ 2013 8 "third" "Wednesday" meetup  2013 8 21 <date> = ] unit-test

"when third Thursday is some day in the middle of the third week" description
{ t } [ 2013 9 "third" "Thursday" meetup  2013 9 19 <date> = ] unit-test

"when third Thursday is another day in the middle of the third week" description
{ t } [ 2013 10 "third" "Thursday" meetup  2013 10 17 <date> = ] unit-test

"when third Friday is the 15th, the first day of the third week" description
{ t } [ 2013 11 "third" "Friday" meetup  2013 11 15 <date> = ] unit-test

"when third Friday is some day in the middle of the third week" description
{ t } [ 2013 12 "third" "Friday" meetup  2013 12 20 <date> = ] unit-test

"when third Saturday is some day in the middle of the third week" description
{ t } [ 2013 1 "third" "Saturday" meetup  2013 1 19 <date> = ] unit-test

"when third Saturday is another day in the middle of the third week" description
{ t } [ 2013 2 "third" "Saturday" meetup  2013 2 16 <date> = ] unit-test

"when third Sunday is some day in the middle of the third week" description
{ t } [ 2013 3 "third" "Sunday" meetup  2013 3 17 <date> = ] unit-test

"when third Sunday is the 21st, the last day of the third week" description
{ t } [ 2013 4 "third" "Sunday" meetup  2013 4 21 <date> = ] unit-test

"when fourth Monday is some day in the middle of the fourth week" description
{ t } [ 2013 3 "fourth" "Monday" meetup  2013 3 25 <date> = ] unit-test

"when fourth Monday is the 22nd, the first day of the fourth week" description
{ t } [ 2013 4 "fourth" "Monday" meetup  2013 4 22 <date> = ] unit-test

"when fourth Tuesday is the 28th, the last day of the fourth week" description
{ t } [ 2013 5 "fourth" "Tuesday" meetup  2013 5 28 <date> = ] unit-test

"when fourth Tuesday is some day in the middle of the fourth week" description
{ t } [ 2013 6 "fourth" "Tuesday" meetup  2013 6 25 <date> = ] unit-test

"when fourth Wednesday is some day in the middle of the fourth week" description
{ t } [ 2013 7 "fourth" "Wednesday" meetup  2013 7 24 <date> = ] unit-test

"when fourth Wednesday is the 28th, the last day of the fourth week" description
{ t } [ 2013 8 "fourth" "Wednesday" meetup  2013 8 28 <date> = ] unit-test

"when fourth Thursday is some day in the middle of the fourth week" description
{ t } [ 2013 9 "fourth" "Thursday" meetup  2013 9 26 <date> = ] unit-test

"when fourth Thursday is another day in the middle of the fourth week" description
{ t } [ 2013 10 "fourth" "Thursday" meetup  2013 10 24 <date> = ] unit-test

"when fourth Friday is the 22nd, the first day of the fourth week" description
{ t } [ 2013 11 "fourth" "Friday" meetup  2013 11 22 <date> = ] unit-test

"when fourth Friday is some day in the middle of the fourth week" description
{ t } [ 2013 12 "fourth" "Friday" meetup  2013 12 27 <date> = ] unit-test

"when fourth Saturday is some day in the middle of the fourth week" description
{ t } [ 2013 1 "fourth" "Saturday" meetup  2013 1 26 <date> = ] unit-test

"when fourth Saturday is another day in the middle of the fourth week" description
{ t } [ 2013 2 "fourth" "Saturday" meetup  2013 2 23 <date> = ] unit-test

"when fourth Sunday is some day in the middle of the fourth week" description
{ t } [ 2013 3 "fourth" "Sunday" meetup  2013 3 24 <date> = ] unit-test

"when fourth Sunday is the 28th, the last day of the fourth week" description
{ t } [ 2013 4 "fourth" "Sunday" meetup  2013 4 28 <date> = ] unit-test

"last Monday in a month with four Mondays" description
{ t } [ 2013 3 "last" "Monday" meetup  2013 3 25 <date> = ] unit-test

"last Monday in a month with five Mondays" description
{ t } [ 2013 4 "last" "Monday" meetup  2013 4 29 <date> = ] unit-test

"last Tuesday in a month with four Tuesdays" description
{ t } [ 2013 5 "last" "Tuesday" meetup  2013 5 28 <date> = ] unit-test

"last Tuesday in another month with four Tuesdays" description
{ t } [ 2013 6 "last" "Tuesday" meetup  2013 6 25 <date> = ] unit-test

"last Wednesday in a month with five Wednesdays" description
{ t } [ 2013 7 "last" "Wednesday" meetup  2013 7 31 <date> = ] unit-test

"last Wednesday in a month with four Wednesdays" description
{ t } [ 2013 8 "last" "Wednesday" meetup  2013 8 28 <date> = ] unit-test

"last Thursday in a month with four Thursdays" description
{ t } [ 2013 9 "last" "Thursday" meetup  2013 9 26 <date> = ] unit-test

"last Thursday in a month with five Thursdays" description
{ t } [ 2013 10 "last" "Thursday" meetup  2013 10 31 <date> = ] unit-test

"last Friday in a month with five Fridays" description
{ t } [ 2013 11 "last" "Friday" meetup  2013 11 29 <date> = ] unit-test

"last Friday in a month with four Fridays" description
{ t } [ 2013 12 "last" "Friday" meetup  2013 12 27 <date> = ] unit-test

"last Saturday in a month with four Saturdays" description
{ t } [ 2013 1 "last" "Saturday" meetup  2013 1 26 <date> = ] unit-test

"last Saturday in another month with four Saturdays" description
{ t } [ 2013 2 "last" "Saturday" meetup  2013 2 23 <date> = ] unit-test

"last Sunday in a month with five Sundays" description
{ t } [ 2013 3 "last" "Sunday" meetup  2013 3 31 <date> = ] unit-test

"last Sunday in a month with four Sundays" description
{ t } [ 2013 4 "last" "Sunday" meetup  2013 4 28 <date> = ] unit-test

"when last Wednesday in February in a leap year is the 29th" description
{ t } [ 2012 2 "last" "Wednesday" meetup  2012 2 29 <date> = ] unit-test

"last Wednesday in December that is also the last day of the year" description
{ t } [ 2014 12 "last" "Wednesday" meetup  2014 12 31 <date> = ] unit-test

"when last Sunday in February in a non-leap year is not the 29th" description
{ t } [ 2015 2 "last" "Sunday" meetup  2015 2 22 <date> = ] unit-test

"when first Friday is the 7th, the last day of the first week" description
{ t } [ 2012 12 "first" "Friday" meetup  2012 12 7 <date> = ] unit-test
