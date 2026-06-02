USING: formatting grouping kernel sequences ;
IN: proverb

: recite ( strings -- lines )
    dup empty? [
        [ 2 <clumps> [ first2 "For want of a %s the %s was lost." sprintf ] map ]
        [ first "And all for the want of a %s." sprintf ] bi suffix
    ] unless ;
