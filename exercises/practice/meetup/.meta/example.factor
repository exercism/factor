USING: calendar calendar.english combinators kernel locals math
sequences ;
IN: meetup

! Each schedule names a 7-day window of the month; the meetup is the
! first occurrence of the target weekday on or after the window's
! start day.
:: first-on-or-after ( year month start dow -- day )
    year month start <date> day-of-week
    dow swap - 7 + 7 mod start + ;

:: meetup ( year month week dayofweek -- timestamp )
    dayofweek day-names index :> dow
    week {
        { "first"  [ 1 ] }
        { "second" [ 8 ] }
        { "third"  [ 15 ] }
        { "fourth" [ 22 ] }
        { "teenth" [ 13 ] }
        { "last"   [ year month 1 <date> days-in-month 6 - ] }
    } case :> start
    year month start dow first-on-or-after :> day
    year month day <date> ;
