USING: hash-sets kernel locals math.bitwise sequences sets ;
IN: allergies

CONSTANT: ALLERGY-NAMES { "eggs" "peanuts" "shellfish" "strawberries"
                         "tomatoes" "chocolate" "pollen" "cats" }

:: allergens ( score -- set )
    HS{ } clone :> result
    ALLERGY-NAMES [| name index |
        score index bit? [ name result adjoin ] when
    ] each-index
    result ;

: allergic-to ( score item -- ? )
    swap allergens in? ;
