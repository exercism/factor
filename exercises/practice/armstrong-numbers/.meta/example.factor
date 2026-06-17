USING: kernel locals math math.functions math.parser sequences ;
IN: armstrong-numbers

:: armstrong? ( n -- ? )
    n number>string [ CHAR: 0 - ] map :> digits
    digits length :> len
    digits [ len ^ ] map-sum n = ;
