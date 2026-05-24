USING: assocs hashtables kernel locals math sequences splitting
       strings ;
IN: kindergarten-garden

CONSTANT: plant-names H{
    { CHAR: V "violets" }
    { CHAR: R "radishes" }
    { CHAR: C "clover" }
    { CHAR: G "grass" }
}

CONSTANT: students {
    "Alice" "Bob" "Charlie" "David" "Eve" "Fred"
    "Ginny" "Harriet" "Ileana" "Joseph" "Kincaid" "Larry"
}

:: plants ( diagram student -- plants )
    diagram "\n" split :> rows
    student students index 2 * :> col
    col 2 + :> col-end
    rows [ [ col col-end ] dip subseq ] map concat
    [ plant-names at ] { } map-as ;
