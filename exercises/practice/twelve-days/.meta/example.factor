USING: formatting kernel math ranges sequences ;
IN: twelve-days

CONSTANT: ordinals {
    "first" "second" "third" "fourth" "fifth" "sixth"
    "seventh" "eighth" "ninth" "tenth" "eleventh" "twelfth"
}

CONSTANT: gifts {
    "a Partridge in a Pear Tree"
    "two Turtle Doves"
    "three French Hens"
    "four Calling Birds"
    "five Gold Rings"
    "six Geese-a-Laying"
    "seven Swans-a-Swimming"
    "eight Maids-a-Milking"
    "nine Ladies Dancing"
    "ten Lords-a-Leaping"
    "eleven Pipers Piping"
    "twelve Drummers Drumming"
}

: gift-phrase ( n -- str )
    gifts swap head reverse
    dup length 1 = [ first ] [
        [ but-last ", " join ", and " append ] [ last ] bi append
    ] if ;

: verse ( n -- line )
    [ 1 - ordinals nth "On the %s day of Christmas my true love gave to me: " sprintf ]
    [ gift-phrase ] bi append "." append ;

: recite ( start end -- lines )
    [a..b] [ verse ] map ;
