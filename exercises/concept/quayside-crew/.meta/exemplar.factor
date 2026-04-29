USING: accessors concurrency.combinators concurrency.locks
concurrency.promises kernel locals math math.statistics sequences
threads ;
IN: quayside-crew

: weigh-crate ( crate -- weight )
    sum ;

: weigh-all ( crates -- weights )
    [ weigh-crate ] parallel-map ;

TUPLE: crane lock tonnage ;

: <crane> ( -- crane )
    <lock> 0 crane boa ;

:: hoist-crate ( weight crane -- )
    crane lock>> [
        crane [ weight + ] change-tonnage drop
    ] with-lock ;

:: crane-tonnage ( crane -- tonnage )
    crane lock>> [ crane tonnage>> ] with-lock ;

:: load-cargo ( crates crane -- )
    crates [| crate |
        <promise> :> p
        [
            crate weigh-crate crane hoist-crate
            t p fulfill
        ] "dockhand" spawn drop
        p
    ] map [ ?promise drop ] each ;
