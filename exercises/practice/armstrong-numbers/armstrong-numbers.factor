USING: kernel locals math math.functions math.order sequences ;
IN: armstrong

:: digits ( xs -- seq )
  xs 10 /mod :> x! :> xs!
  1 { } new-resizable :> digits
  x digits push

  [ xs 0 = not ]
  [
    xs 10 /mod x! xs!
    x digits push
  ] while

  digits ;

: armstrong? ( x -- ? )
  "unimplemented" throw ;

