USING: arrays kernel locals math ranges sequences unicode ;
IN: bottle-song

CONSTANT: numbers {
    "no" "one" "two" "three" "four" "five" "six"
    "seven" "eight" "nine" "ten"
}

: bottles ( n -- str )
    dup numbers nth " green bottle" append
    swap 1 = [ "s" append ] unless ;

: cap ( str -- str' )
    unclip ch>upper prefix ;

:: verse ( n -- lines )
    n bottles cap " hanging on the wall," append :> top
    "There'll be " n 1 - bottles append " hanging on the wall." append :> bottom
    top top "And if one green bottle should accidentally fall," bottom 4array ;

:: recite ( start take -- lines )
    start start take - 1 + [a..b] [ verse ] map { "" } join ;
