USING: log-levels tools.test ;
IN: log-levels.tests

! TASK: 1 message
{ "Stack overflow" }   [ "[ERROR]: Stack overflow" message ] unit-test
{ "Disk almost full" } [ "[WARNING]: Disk almost full" message ] unit-test
{ "File moved" }       [ "[INFO]: File moved" message ] unit-test
{ "Timezone not set" } [ "[WARNING]:   \tTimezone not set  \r\n" message ] unit-test

! TASK: 2 log-level
{ "error" }   [ "[ERROR]: Disk full" log-level ] unit-test
{ "warning" } [ "[WARNING]: Unsafe password" log-level ] unit-test
{ "info" }    [ "[INFO]: Timezone changed" log-level ] unit-test

! TASK: 3 reformat
{ "Decreased performance (warning)" } [ "[WARNING]: Decreased performance" reformat ] unit-test
{ "Disk full (error)" }               [ "[ERROR]: Disk full" reformat ] unit-test
{ "File deleted (info)" }             [ "[INFO]: File deleted" reformat ] unit-test
