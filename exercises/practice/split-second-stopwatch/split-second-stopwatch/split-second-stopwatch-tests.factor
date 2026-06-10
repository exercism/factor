USING: exercism-tools io kernel locals split-second-stopwatch tools.test unicode ;
IN: split-second-stopwatch.tests

"new stopwatch starts in ready state" description
{ "ready" } [
    [let <stopwatch> :> sw
      sw state
    ]
] unit-test

STOP-HERE

"new stopwatch's current lap has no elapsed time" description
{ "00:00:00" } [
    [let <stopwatch> :> sw
      sw current-lap
    ]
] unit-test

"new stopwatch's total has no elapsed time" description
{ "00:00:00" } [
    [let <stopwatch> :> sw
      sw total
    ]
] unit-test

"new stopwatch does not have previous laps" description
{ { } } [
    [let <stopwatch> :> sw
      sw previous-laps
    ]
] unit-test

"start from ready state changes state to running" description
{ "running" } [
    [let <stopwatch> :> sw
      sw start
      sw state
    ]
] unit-test

"start does not change previous laps" description
{ { } } [
    [let <stopwatch> :> sw
      sw start
      sw previous-laps
    ]
] unit-test

"start initiates time tracking for current lap" description
{ "00:00:05" } [
    [let <stopwatch> :> sw
      sw start
      "00:00:05" sw advance-time
      sw current-lap
    ]
] unit-test

"start initiates time tracking for total" description
{ "00:00:23" } [
    [let <stopwatch> :> sw
      sw start
      "00:00:23" sw advance-time
      sw total
    ]
] unit-test

"start cannot be called from running state" description
[
    [let <stopwatch> :> sw
      sw start
      sw start
    ]
] must-fail

"stop from running state changes state to stopped" description
{ "stopped" } [
    [let <stopwatch> :> sw
      sw start
      sw stop
      sw state
    ]
] unit-test

"stop pauses time tracking for current lap" description
{ "00:00:05" } [
    [let <stopwatch> :> sw
      sw start
      "00:00:05" sw advance-time
      sw stop
      "00:00:08" sw advance-time
      sw current-lap
    ]
] unit-test

"stop pauses time tracking for total" description
{ "00:00:13" } [
    [let <stopwatch> :> sw
      sw start
      "00:00:13" sw advance-time
      sw stop
      "00:00:44" sw advance-time
      sw total
    ]
] unit-test

"stop cannot be called from ready state" description
[
    [let <stopwatch> :> sw
      sw stop
    ]
] must-fail

"stop cannot be called from stopped state" description
[
    [let <stopwatch> :> sw
      sw start
      sw stop
      sw stop
    ]
] must-fail

"start from stopped state changes state to running" description
{ "running" } [
    [let <stopwatch> :> sw
      sw start
      sw stop
      sw start
      sw state
    ]
] unit-test

"start from stopped state resumes time tracking for current lap" description
{ "00:01:28" } [
    [let <stopwatch> :> sw
      sw start
      "00:01:20" sw advance-time
      sw stop
      "00:00:20" sw advance-time
      sw start
      "00:00:08" sw advance-time
      sw current-lap
    ]
] unit-test

"start from stopped state resumes time tracking for total" description
{ "00:00:32" } [
    [let <stopwatch> :> sw
      sw start
      "00:00:23" sw advance-time
      sw stop
      "00:00:44" sw advance-time
      sw start
      "00:00:09" sw advance-time
      sw total
    ]
] unit-test

"lap adds current lap to previous laps" description
{ { "00:01:38" } { "00:01:38" "00:00:44" } } [
    [let <stopwatch> :> sw
      sw start
      "00:01:38" sw advance-time
      sw lap
      sw previous-laps
      "00:00:44" sw advance-time
      sw lap
      sw previous-laps
    ]
] unit-test

"lap resets current lap and resumes time tracking" description
{ "00:00:00" "00:00:15" } [
    [let <stopwatch> :> sw
      sw start
      "00:08:22" sw advance-time
      sw lap
      sw current-lap
      "00:00:15" sw advance-time
      sw current-lap
    ]
] unit-test

"lap continues time tracking for total" description
{ "00:00:55" } [
    [let <stopwatch> :> sw
      sw start
      "00:00:22" sw advance-time
      sw lap
      "00:00:33" sw advance-time
      sw total
    ]
] unit-test

"lap cannot be called from ready state" description
[
    [let <stopwatch> :> sw
      sw lap
    ]
] must-fail

"lap cannot be called from stopped state" description
[
    [let <stopwatch> :> sw
      sw start
      sw stop
      sw lap
    ]
] must-fail

"stop does not change previous laps" description
{ { "00:11:22" } { "00:11:22" } } [
    [let <stopwatch> :> sw
      sw start
      "00:11:22" sw advance-time
      sw lap
      sw previous-laps
      sw stop
      sw previous-laps
    ]
] unit-test

"reset from stopped state changes state to ready" description
{ "ready" } [
    [let <stopwatch> :> sw
      sw start
      sw stop
      sw reset
      sw state
    ]
] unit-test

"reset resets current lap" description
{ "00:00:00" } [
    [let <stopwatch> :> sw
      sw start
      "00:00:10" sw advance-time
      sw stop
      sw reset
      sw current-lap
    ]
] unit-test

"reset clears previous laps" description
{ { "00:00:10" "00:00:20" } { } } [
    [let <stopwatch> :> sw
      sw start
      "00:00:10" sw advance-time
      sw lap
      "00:00:20" sw advance-time
      sw lap
      sw previous-laps
      sw stop
      sw reset
      sw previous-laps
    ]
] unit-test

"reset cannot be called from ready state" description
[
    [let <stopwatch> :> sw
      sw reset
    ]
] must-fail

"reset cannot be called from running state" description
[
    [let <stopwatch> :> sw
      sw start
      sw reset
    ]
] must-fail

"supports very long laps" description
{ "01:23:45" { "01:23:45" } "04:01:40" "05:25:25" { "01:23:45" "04:01:40" } "08:43:05" "14:08:30" { "01:23:45" "04:01:40" "08:43:05" } } [
    [let <stopwatch> :> sw
      sw start
      "01:23:45" sw advance-time
      sw current-lap
      sw lap
      sw previous-laps
      "04:01:40" sw advance-time
      sw current-lap
      sw total
      sw lap
      sw previous-laps
      "08:43:05" sw advance-time
      sw current-lap
      sw total
      sw lap
      sw previous-laps
    ]
] unit-test
