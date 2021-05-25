USING: combinators kernel math.functions math.parser sequences ;
IN: raindrops

: raindrops ( n -- str )
  dup
  [ 3 divisor? "Pling" and ]
  [ 5 divisor? "Plang" and ]
  [ 7 divisor? "Plong" and ] tri
  { } 3sequence sift
  [ number>string ] [ concat swap drop ] if-empty ;

