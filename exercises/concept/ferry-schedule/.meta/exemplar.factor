USING: calendar calendar.english kernel sequences ;
IN: ferry-schedule

: make-date ( year month day -- timestamp )
    <date> ;

: weekday-name ( timestamp -- name )
    day-of-week day-names nth ;

: leap? ( year -- ? )
    leap-year? ;

: month-length ( year month -- n )
    1 <date> days-in-month ;

: add-days ( timestamp n -- timestamp )
    days time+ ;
