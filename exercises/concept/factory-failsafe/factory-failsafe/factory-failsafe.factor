USING: kernel ;
IN: factory-failsafe

: check-humidity ( h -- )
    "unimplemented" throw ;

: check-temperature ( t -- )
    "unimplemented" throw ;

! TASK 3: Define a machine-error error class.

: monitor ( h t -- )
    "unimplemented" throw ;

: monitor-batch ( readings -- count )
    "unimplemented" throw ;
