USING: alphametics exercism-tools hashtables io kernel tools.test unicode ;
IN: alphametics.tests

"puzzle with three letters" description
{ H{ { CHAR: B 9 } { CHAR: I 1 } { CHAR: L 0 } } } [ "I + BB == ILL" solve ] unit-test

STOP-HERE

"solution must have unique value for each letter" description
{ f } [ "A == B" solve ] unit-test

"leading zero solution is invalid" description
{ f } [ "ACA + DD == BD" solve ] unit-test

"puzzle with two digits final carry" description
{ H{ { CHAR: B 1 } { CHAR: A 9 } { CHAR: C 0 } } } [ "A + A + A + A + A + A + A + A + A + A + A + B == BCC" solve ] unit-test

"puzzle with four letters" description
{ H{ { CHAR: A 9 } { CHAR: S 2 } { CHAR: M 1 } { CHAR: O 0 } } } [ "AS + A == MOM" solve ] unit-test

"puzzle with six letters" description
{ H{ { CHAR: A 0 } { CHAR: T 9 } { CHAR: N 7 } { CHAR: L 1 } { CHAR: E 2 } { CHAR: O 4 } } } [ "NO + NO + TOO == LATE" solve ] unit-test

"puzzle with seven letters" description
{ H{ { CHAR: I 0 } { CHAR: S 9 } { CHAR: T 7 } { CHAR: G 2 } { CHAR: E 4 } { CHAR: L 1 } { CHAR: H 5 } } } [ "HE + SEES + THE == LIGHT" solve ] unit-test

"puzzle with eight letters" description
{ H{ { CHAR: Y 2 } { CHAR: S 9 } { CHAR: M 1 } { CHAR: N 6 } { CHAR: D 7 } { CHAR: E 5 } { CHAR: R 8 } { CHAR: O 0 } } } [ "SEND + MORE == MONEY" solve ] unit-test

"puzzle with ten letters" description
{ H{ { CHAR: A 5 } { CHAR: S 6 } { CHAR: T 9 } { CHAR: N 0 } { CHAR: D 3 } { CHAR: G 8 } { CHAR: E 4 } { CHAR: R 1 } { CHAR: F 7 } { CHAR: O 2 } } } [ "AND + A + STRONG + OFFENSE + AS + A + GOOD == DEFENSE" solve ] unit-test

"puzzle with ten letters and 199 addends" description
{ H{ { CHAR: O 6 } { CHAR: A 1 } { CHAR: I 7 } { CHAR: S 4 } { CHAR: T 9 } { CHAR: L 2 } { CHAR: E 0 } { CHAR: R 3 } { CHAR: F 5 } { CHAR: H 8 } } } [ "THIS + A + FIRE + THEREFORE + FOR + ALL + HISTORIES + I + TELL + A + TALE + THAT + FALSIFIES + ITS + TITLE + TIS + A + LIE + THE + TALE + OF + THE + LAST + FIRE + HORSES + LATE + AFTER + THE + FIRST + FATHERS + FORESEE + THE + HORRORS + THE + LAST + FREE + TROLL + TERRIFIES + THE + HORSES + OF + FIRE + THE + TROLL + RESTS + AT + THE + HOLE + OF + LOSSES + IT + IS + THERE + THAT + SHE + STORES + ROLES + OF + LEATHERS + AFTER + SHE + SATISFIES + HER + HATE + OFF + THOSE + FEARS + A + TASTE + RISES + AS + SHE + HEARS + THE + LEAST + FAR + HORSE + THOSE + FAST + HORSES + THAT + FIRST + HEAR + THE + TROLL + FLEE + OFF + TO + THE + FOREST + THE + HORSES + THAT + ALERTS + RAISE + THE + STARES + OF + THE + OTHERS + AS + THE + TROLL + ASSAILS + AT + THE + TOTAL + SHIFT + HER + TEETH + TEAR + HOOF + OFF + TORSO + AS + THE + LAST + HORSE + FORFEITS + ITS + LIFE + THE + FIRST + FATHERS + HEAR + OF + THE + HORRORS + THEIR + FEARS + THAT + THE + FIRES + FOR + THEIR + FEASTS + ARREST + AS + THE + FIRST + FATHERS + RESETTLE + THE + LAST + OF + THE + FIRE + HORSES + THE + LAST + TROLL + HARASSES + THE + FOREST + HEART + FREE + AT + LAST + OF + THE + LAST + TROLL + ALL + OFFER + THEIR + FIRE + HEAT + TO + THE + ASSISTERS + FAR + OFF + THE + TROLL + FASTS + ITS + LIFE + SHORTER + AS + STARS + RISE + THE + HORSES + REST + SAFE + AFTER + ALL + SHARE + HOT + FISH + AS + THEIR + AFFILIATES + TAILOR + A + ROOFS + FOR + THEIR + SAFE == FORTRESSES" solve ] unit-test
