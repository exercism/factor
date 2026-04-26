USING: assocs kernel math.statistics sequences unicode ;
IN: scrabble-score

CONSTANT: letter-scores H{
    { CHAR: A 1 } { CHAR: B 3 } { CHAR: C 3 } { CHAR: D 2 }
    { CHAR: E 1 } { CHAR: F 4 } { CHAR: G 2 } { CHAR: H 4 }
    { CHAR: I 1 } { CHAR: J 8 } { CHAR: K 5 } { CHAR: L 1 }
    { CHAR: M 3 } { CHAR: N 1 } { CHAR: O 1 } { CHAR: P 3 }
    { CHAR: Q 10 } { CHAR: R 1 } { CHAR: S 1 } { CHAR: T 1 }
    { CHAR: U 1 } { CHAR: V 4 } { CHAR: W 4 } { CHAR: X 8 }
    { CHAR: Y 4 } { CHAR: Z 10 }
}

: score ( word -- n )
    >upper [ letter-scores at ] map-sum ;
