USING: kernel math random random.mersenne-twister ;
IN: boardwalk-games

: roll-die ( sides -- n )
    random 1 + ;

: pick-prize ( prizes -- prize )
    random ;

: shuffle-deck ( deck -- deck' )
    randomize ;

: deal-hand ( deck n -- hand )
    sample ;

: play-seeded ( seed quot -- )
    [ <mersenne-twister> ] dip with-random ; inline
