# Instructions

It's another busy night at the Antwerp marshalling yard. You're
the dispatcher on duty: incoming freight cars need to be
regrouped into outbound trains, couplings inspected, routes split
at junctions, and identical cargo coalesced for billing.

Each *car* is a string naming what it's carrying:
`"coal"`, `"timber"`, `"crates"`, etc.

## 1. Couple cars into trains

Define `couple` to take an array of cars and a length `n`, and
return non-overlapping trains of `n` cars each. The final train
may be shorter if the count doesn't divide evenly.

```factor
{ "coal" "coal" "coke" "ore" "ore" "timber" "timber" } 3 couple .
! => { { "coal" "coal" "coke" } { "ore" "ore" "timber" } { "timber" } }
```

## 2. Peek at the couplings

Define `peek-couplings` to take an array of cars and return every
adjacent pair, so the inspector can examine each coupling.

```factor
{ "coal" "ore" "timber" "crates" } peek-couplings .
! => { { "coal" "ore" } { "ore" "timber" } { "timber" "crates" } }
```

## 3. Split the chain at junctions

Define `split-at-junctions` to take an array of cars and an
array of `junctions` (cars that mark a break point), and return
the legs between junction cars. The junction cars themselves
aren't kept.

```factor
{ "coal" "coal" "switch" "ore" "switch" "timber" }
{ "switch" } split-at-junctions .
! => { { "coal" "coal" } { "ore" } { "timber" } }
```

## 4. Coalesce identical cargo

Define `coalesce-cargo` to take an array of cars and group
*consecutive* cars carrying the same cargo into runs.

```factor
{ "coal" "coal" "ore" "ore" "ore" "timber" "coal" } coalesce-cargo .
! => { { "coal" "coal" } { "ore" "ore" "ore" } { "timber" } { "coal" } }
```
