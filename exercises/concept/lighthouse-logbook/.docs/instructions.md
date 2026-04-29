# Instructions

You are the keeper at Cape Crozier lighthouse. From the lantern
room you log every vessel that passes by — each is identified by
a unique callsign — and you also coordinate signal relays with
the other lighthouses up and down the coast.

## 1. A fresh logbook

Define `empty-log` to return a fresh empty hash-set, ready to
collect callsigns.

```factor
empty-log .
! => HS{ }
```

## 2. Record a sighting

Define `sight` to take a logbook and a callsign, and record the
sighting in place. Returns nothing.

```factor
empty-log dup "NS-1024" sight .
! => HS{ "NS-1024" }
```

## 3. Have we seen this one?

Define `seen?` to take a logbook and a callsign, returning `t`
if the callsign has been recorded and `f` otherwise.

```factor
HS{ "NS-1024" "WB-203" } "NS-1024" seen? .   ! => t
HS{ "NS-1024" "WB-203" } "X-99"    seen? .   ! => f
```

## 4. Forget a sighting

Define `forget-sighting` to take a logbook and a callsign and
remove the callsign from the log in place. Returns nothing. If
the callsign isn't there, do nothing.

```factor
HS{ "NS-1024" "WB-203" } clone dup "WB-203" forget-sighting .
! => HS{ "NS-1024" }
```

## 5. How many distinct vessels?

Define `unique-count` to return the number of distinct
callsigns in the log.

```factor
HS{ "NS-1024" "WB-203" "AC-77" } unique-count .   ! => 3
empty-log unique-count .                          ! => 0
```

## 6. Reachable lighthouses

The coast guard maintains a `relay-map`: a hashtable keyed by
lighthouse name, with each value being an array of the
lighthouses that the keyed one can directly relay to.

Define `reachable` to take a `start` lighthouse and a
`relay-map`, and return a hash-set of every lighthouse reachable
from `start` (including `start` itself) by repeated relays.

```factor
H{
    { "Crozier"  { "Beacon"  "Hadley"  } }
    { "Beacon"   { "Crozier" "Spiral"  } }
    { "Hadley"   { "Crozier"           } }
    { "Spiral"   { "Beacon"  "Outpost" } }
    { "Outpost"  { "Spiral"            } }
    { "Far-Isle" { "Lonely"            } }
    { "Lonely"   { "Far-Isle"          } }
}
"Crozier" swap reachable .
! => HS{ "Crozier" "Beacon" "Hadley" "Spiral" "Outpost" }
```

The `Far-Isle`/`Lonely` pair is its own connected component, so
neither appears in the result.
