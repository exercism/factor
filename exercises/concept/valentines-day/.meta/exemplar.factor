USING: arrays combinators kernel math sequences ;
IN: valentines-day

SYMBOLS: yes no maybe
    korean turkish
    crime horror romance thriller
    board-game chill movie restaurant walk ;

: rate-restaurant ( cuisine -- approval )
    {
        { korean [ yes ] }
        { turkish [ maybe ] }
    } case ;

: rate-movie ( genre -- approval )
    {
        { romance [ yes ] }
        [ drop no ]
    } case ;

: rate-walk ( km -- approval )
    {
        { [ dup 11 > ] [ drop yes ] }
        { [ dup 6 > ] [ drop maybe ] }
        [ drop no ]
    } cond ;

: rate-activity ( activity -- approval )
    first2 swap {
        { board-game [ drop no ] }
        { chill [ drop no ] }
        { movie [ rate-movie ] }
        { restaurant [ rate-restaurant ] }
        { walk [ rate-walk ] }
    } case ;

: approval-counts ( activities -- counts )
    [ rate-activity ] map
    [ [ yes = ] count ]
    [ [ maybe = ] count ]
    [ [ no = ] count ]
    tri 3array ;
