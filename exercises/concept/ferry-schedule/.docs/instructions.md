# Instructions

You keep the sailing timetable for a small island ferry. Departures are
recorded as dates, and you need a few helpers to work with them.

## 1. Record a sailing date

Define `make-date` to take a year, month, and day and return the
corresponding timestamp.

```factor
2024 7 14 make-date .
! => T{ timestamp { year 2024 } { month 7 } { day 14 } ... }
```

## 2. Name the weekday

Define `weekday-name` to take a sailing's timestamp and return the name
of the weekday it falls on.

```factor
2024 1 8 make-date weekday-name .
! => "Monday"
```

## 3. Leap years

Define `leap?` to take a year and return whether it is a leap year.

```factor
2024 leap? .   ! => t
2023 leap? .   ! => f
```

## 4. Days in a month

Define `month-length` to take a year and a month and return the number
of days in that month (remember February).

```factor
2024 2 month-length .   ! => 29
2023 2 month-length .   ! => 28
```

## 5. Days later

Define `add-days` to take a timestamp and a number of days, and return
the timestamp that many days later.

```factor
2024 2 28 make-date 1 add-days >date< .
! => 29   (2024-02-29)
```
