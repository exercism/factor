USING: arrays kernel locals macros math quotations ranges sequences ;
IN: food-chain

! Unroll a quotation over a literal sequence at compile time: the
! runtime program is straight-line code, with one inlined copy of the
! quotation per element and no iteration left to do.
MACRO: each-literal ( seq quot -- compound )
    [ curry ] curry map concat >quotation ;

CONSTANT: animals { "fly" "spider" "bird" "cat" "dog" "goat" "cow" "horse" }

CONSTANT: comments {
    ""
    "It wriggled and jiggled and tickled inside her."
    "How absurd to swallow a bird!"
    "Imagine that, to swallow a cat!"
    "What a hog, to swallow a dog!"
    "Just opened her throat and swallowed a goat!"
    "I don't know how she swallowed a cow!"
    ""
}

:: catch-line ( predator prey -- str )
    prey "spider" =
    " that wriggled and jiggled and tickled inside her" "" ? :> suffix
    "She swallowed the " predator append " to catch the " append
    prey append suffix append "." append ;

! The cumulative predator-to-prey lines are fixed, so the macro unrolls
! catch-line over the literal pair table, building the array of links
! with one inlined step per pair.
: links ( -- seq )
    { }
    {
        { "spider" "fly" }
        { "bird" "spider" }
        { "cat" "bird" }
        { "dog" "cat" }
        { "goat" "dog" }
        { "cow" "goat" }
    } [ first2 catch-line suffix ] each-literal ;

:: verse ( idx -- lines )
    "I know an old lady who swallowed a " idx animals nth append "." append :> intro
    idx 7 = [
        intro "She's dead, of course!" 2array
    ] [
        intro 1array
        idx comments nth dup empty? [ drop ] [ suffix ] if
        links idx head reverse append
        "I don't know why she swallowed the fly. Perhaps she'll die." suffix
    ] if ;

:: food-chain ( start end -- lines )
    start end [a..b] [ 1 - verse ] map { "" } join ;
