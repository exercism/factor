USING: combinators kernel locals math sequences ;
IN: series

:: slices ( series len -- slices )
    {
        { [ len 0 = ] [ "slice length cannot be zero" throw ] }
        { [ len 0 < ] [ "slice length cannot be negative" throw ] }
        { [ series length 0 = ] [ "series cannot be empty" throw ] }
        { [ len series length > ]
          [ "slice length cannot be greater than series length" throw ] }
        [ series length len - 1 + <iota>
          [| i | i i len + series subseq ] map ]
    } cond ;
