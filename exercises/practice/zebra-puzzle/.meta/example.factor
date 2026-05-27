USING: kernel locals math sequences ;
IN: zebra-puzzle

SYMBOLS: red green ivory yellow blue
         Englishman Spaniard Ukrainian Norwegian Japanese
         dog snails fox horse zebra
         coffee tea milk orange-juice water
         dancing painting reading football chess ;

CONSTANT: colours { red green ivory yellow blue }
CONSTANT: nations { Englishman Spaniard Ukrainian Norwegian Japanese }
CONSTANT: pets    { dog snails fox horse zebra }
CONSTANT: drinks  { coffee tea milk orange-juice water }
CONSTANT: hobbies { dancing painting reading football chess }

! Every arrangement of the five values across the five houses.
:: permutations ( seq -- seqs )
    seq empty?
    [ { { } } ]
    [
        seq length <iota> [| i |
            i seq nth :> x
            i seq remove-nth permutations [ x prefix ] map
        ] map concat
    ] if ;

! Brute force, pruning each category against the constraints that only
! involve already-chosen categories. `index` gives a value's house (0-4).
:: zebra-solution ( -- nations drinks pets )
    colours permutations [| col |
        green col index  ivory col index 1 + =
    ] filter [| col |
        nations permutations [| nat |
            Englishman nat index  red col index =
            Norwegian nat index 0 = and
            Norwegian nat index  blue col index - abs 1 = and
        ] filter [| nat |
            drinks permutations [| dr |
                coffee dr index  green col index =
                Ukrainian nat index  tea dr index = and
                milk dr index 2 = and
            ] filter [| dr |
                hobbies permutations [| hob |
                    painting hob index  yellow col index =
                    football hob index  orange-juice dr index = and
                    Japanese nat index  chess hob index = and
                ] filter [| hob |
                    pets permutations [| pt |
                        Spaniard nat index  dog pt index =
                        dancing hob index  snails pt index = and
                        reading hob index  fox pt index - abs 1 = and
                        painting hob index  horse pt index - abs 1 = and
                    ] filter [| pt | { nat dr pt } ] map
                ] map concat
            ] map concat
        ] map concat
    ] map concat
    first first3 ;

: drinks-water ( -- nationality )
    zebra-solution drop water swap index swap nth ;

: owns-zebra ( -- nationality )
    zebra-solution nip zebra swap index swap nth ;
