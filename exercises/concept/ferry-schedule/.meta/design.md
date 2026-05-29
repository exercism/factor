# Design

## Goal

Introduce the `calendar` vocabulary: building and inspecting
timestamps, and shifting them with durations.

## Learning objectives

- Build a `timestamp` with `<date>` and split it with `>date<`.
- Read the weekday with `day-of-week` (0 = Sunday) and name it via
  `day-names`.
- Use `leap-year?` and `days-in-month`.
- Build a `duration` with `days` and shift a timestamp using `time+`.
- Recognise that timestamps naming the same instant compare equal
  with `=`.

## Out of scope

- Times of day and time-of-day arithmetic (`set-time`, `+hour`,
  `<timestamp>`), time zones, and `now`.
- `duration` introspection (`duration>days`, `time-`) and the full set
  of duration constructors.
- Parsing and formatting timestamps (`calendar.format`).

## Concepts

- `calendar`: timestamps, `<date>` / `>date<`, `day-of-week`,
  `leap-year?`, `days-in-month`, and duration arithmetic via `time+`.

## Prerequisites

- `numbers` — taught in `currency-conversion` (the year/month/day
  values).
- `sequences` — taught in `backyard-birdwatcher` (`nth` into
  `day-names`).
