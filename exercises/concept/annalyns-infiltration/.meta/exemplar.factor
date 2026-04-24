USING: kernel locals ;
IN: annalyns-infiltration

: can-do-fast-attack ( knight-awake -- ? )
    not ;

: can-spy ( knight-awake archer-awake prisoner-awake -- ? )
    or or ;

: can-signal-prisoner ( archer-awake prisoner-awake -- ? )
    swap not and ;

:: can-free-prisoner ( knight-awake archer-awake prisoner-awake dog-present -- ? )
    dog-present archer-awake not and
    prisoner-awake knight-awake not and archer-awake not and
    or ;
