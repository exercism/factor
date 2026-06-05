USING: combinators kernel locals math math.parser sequences splitting ;
IN: wordy

ERROR: invalid-question ;

! Collapse the two-word operations into single tokens so the question
! can be tokenised on whitespace.
: normalize ( expr -- expr' )
    " multiplied by " " multiplied " replace
    " divided by " " divided " replace ;

:: answer ( question -- result )
    question "What is" ?head [ invalid-question ] unless
    "?" ?tail [ invalid-question ] unless
    normalize " " split harvest :> tokens
    tokens length :> n
    n 0 = [ invalid-question ] when
    0 tokens nth string>number dup [ invalid-question ] unless :> acc!
    1 :> i!
    [ i n < ] [
        i tokens nth :> op
        i 1 + n >= [ invalid-question ] when
        i 1 + tokens nth string>number dup [ invalid-question ] unless :> operand
        op {
            { "plus" [ acc operand + ] }
            { "minus" [ acc operand - ] }
            { "multiplied" [ acc operand * ] }
            { "divided" [ acc operand / ] }
            [ drop invalid-question ]
        } case acc!
        i 2 + i!
    ] while
    acc ;
