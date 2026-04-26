USING: kernel math math.statistics sequences ;
IN: backyard-birdwatcher

: today ( days -- count )
    last ;

: increment-todays-count ( days -- new-days )
    unclip-last 1 + suffix ;

: has-day-without-birds? ( days -- ? )
    [ zero? ] any? ;

: count-for-first-days ( days n -- count )
    head sum ;

: busy-days ( days -- count )
    [ 5 >= ] count ;
