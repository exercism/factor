# Instructions append

## Words

Define a `stopwatch` tuple and a constructor `<stopwatch> ( -- stopwatch )`
that returns a new stopwatch in the `"ready"` state with no elapsed time and
no previous laps.

Provide these words operating on a stopwatch:

- `state ( stopwatch -- str )` — `"ready"`, `"running"`, or `"stopped"`.
- `current-lap ( stopwatch -- str )` — the current lap's elapsed time as an
  `"HH:MM:SS"` string.
- `total ( stopwatch -- str )` — the combined elapsed time of the current lap
  and all previous laps, as an `"HH:MM:SS"` string.
- `previous-laps ( stopwatch -- seq )` — an array of the previously recorded
  laps, each as an `"HH:MM:SS"` string.
- `start ( stopwatch -- )`, `stop ( stopwatch -- )`, `reset ( stopwatch -- )`,
  and `lap ( stopwatch -- )` — the four commands from the table above. Calling
  one from a state that does not allow it should `throw` an error.

Time is advanced with:

- `advance-time ( str stopwatch -- )` — add the `"HH:MM:SS"` duration to the
  current lap. This only has an effect while the stopwatch is running.
