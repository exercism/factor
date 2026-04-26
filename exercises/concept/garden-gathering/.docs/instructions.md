# Instructions

Your community association is asking you to manage the garden's
plot registrations. The state lives in two dynamic variables:

- `registrations` — a vector of `plot` tuples currently assigned
  to a person.
- `next-id` — the integer to use for the next registration.

The `plot` tuple has two slots:

| slot            | type     |
| --------------- | -------- |
| `id`            | integer  |
| `registered-to` | string   |

## 1. Open the garden

Define `open-garden` to initialise the dynamic variables: an empty
vector for `registrations`, and `1` for `next-id`.

```factor
open-garden
```

## 2. List the registrations

Define `list-registrations` to return the current vector of plots.

```factor
open-garden
list-registrations .
! => V{ }
```

## 3. Register a plot

Define `register` to take a name off the stack, build a fresh `plot`
with the next available id, append it to the `registrations` vector,
bump `next-id` by one, and return the new plot.

```factor
open-garden
"Emma Balan" register .
! => T{ plot { id 1 } { registered-to "Emma Balan" } }

list-registrations .
! => V{ T{ plot { id 1 } { registered-to "Emma Balan" } } }
```

Plot ids must be unique and increase even after a release — `next-id`
should never reuse a value.

## 4. Release a plot

Define `release` to take an id and remove the matching entry from
`registrations`. Releasing an unknown id is a no-op.

```factor
open-garden
"Emma" register drop
1 release
list-registrations .
! => V{ }
```

## 5. Get a registered plot

Define `get-registration` to take an id and return the matching
plot, or the symbol `not-found` if no plot has that id.

```factor
open-garden
"Emma" register drop
1 get-registration .
! => T{ plot { id 1 } { registered-to "Emma" } }

7 get-registration .
! => not-found
```

## 6. Find plots by name

Define `find-by-name` to take a name and return a vector of all plots
currently registered to that person.

```factor
open-garden
"Emma" register drop
"Bob" register drop
"Emma" register drop
"Emma" find-by-name .
! => V{ T{ plot { id 1 } { registered-to "Emma" } }
        T{ plot { id 3 } { registered-to "Emma" } } }
```
