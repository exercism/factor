USING: kernel locals math math.order sequences sorting ;
IN: book-store

:: tally ( basket -- seq )
    V{ 0 0 0 0 0 0 } clone
    basket
    over
    '[
        _ [ 1 + ] change-nth
    ]
    each ;

:: differences ( seq -- seq' )
    5 <iota>
    [
        [ 1 + seq nth ] [ seq nth ] bi -
    ]
    map
    reverse
    0 prefix ;

:: price ( seq -- cents )
        3 seq nth
        5 seq nth
        min -40 * ! two groups of four are cheaper than a group of three and a group of five
        1 seq nth 800 * +
        2 seq nth 1520 * +
        3 seq nth 2160 * +
        4 seq nth 2560 * +
        5 seq nth 3000 * + ;

: total ( basket -- cents )
    tally
    sort
    differences
    price ;
