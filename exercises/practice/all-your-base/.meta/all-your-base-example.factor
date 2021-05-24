USING: combinators kernel locals math math.functions math.ranges sequences ;
IN: all-your-base

:: powers ( base n -- seq )
  n [0,b) reverse
  [ base swap ^ ] map ;

:: from-digits ( digits base -- x )
  digits length :> n

  base n powers
  digits [ * ] 2map sum ;

:: (to-digits) ( digits x base -- newdigits )
  x 0 <=
  [ digits ]
  [ digits x base mod suffix
    x base /i
    base
    (to-digits)
  ]
  if ;

:: to-digits ( x base -- digits )
  { } x base (to-digits) reverse :> newdigits

  newdigits length 0 =
  [ { 0 } ]
  [ newdigits ] if ;

:: invalid-digits? ( digits base -- ? )
  digits
  [ [ 0 < ] any? ]
  [ [ base >= ] any? ]
  bi or ;

:: rebase ( digits base1 base2 -- newdigits )
  {
    { [ base1 2 < ] [ "input base must be >= 2" throw ] }
    { [ base2 2 < ] [ "output base must be >= 2" throw ] }
    { [ digits base1 invalid-digits? ]
      [ "all digits must satisfy 0 <= d < input base" throw ]
    }
    [ digits base1 from-digits base2 to-digits ]
  } cond ;

