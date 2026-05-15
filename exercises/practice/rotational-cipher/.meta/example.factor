USING: combinators fry kernel math math.order sequences ;
IN: rotational-cipher

: shift-from ( base ch shift -- ch' )
    swap pick - + 26 mod + ;

: shift-char ( ch shift -- ch' )
    {
        { [ over CHAR: a CHAR: z between? ] [ [ CHAR: a ] 2dip shift-from ] }
        { [ over CHAR: A CHAR: Z between? ] [ [ CHAR: A ] 2dip shift-from ] }
        [ drop ]
    } cond ;

: rotate ( text shift -- cipher )
    '[ _ shift-char ] map ;
