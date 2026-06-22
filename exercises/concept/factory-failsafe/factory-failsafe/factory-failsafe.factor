USING: kernel ;
IN: factory-failsafe

! Task 1: Define a machine-error error class.

: check-humidity ( h -- )
    "unimplemented" throw ;

: check-temperature ( t -- )
    "unimplemented" throw ;

: monitor ( h t -- )
    "unimplemented" throw ;

: monitor-batch ( readings -- count )
    "unimplemented" throw ;
