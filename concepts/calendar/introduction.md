# Introduction

Factor's [`calendar`][calendar] vocabulary represents a point in time as
a `timestamp` and a span of time as a `duration`.

```factor
USING: calendar ;

2024 7 14 <date> .          ! a timestamp at midnight on 2024-07-14
2024 7 14 <date> >date< .   ! => 14   (2024 and 7 below it)
```

`day-of-week` returns `0` for Sunday through `6` for Saturday;
`leap-year?` and `days-in-month` answer the usual calendar questions:

```factor
2024 1 8 <date> day-of-week .          ! => 1
2024 leap-year? .                      ! => t
2024 2 1 <date> days-in-month .        ! => 29
```

Durations such as `days` and `weeks` shift a timestamp with `time+`:

```factor
2024 2 28 <date> 1 days time+ >date< .
! => 29   (2024-02-29)
```

[calendar]: https://docs.factorcode.org/content/vocab-calendar.html
