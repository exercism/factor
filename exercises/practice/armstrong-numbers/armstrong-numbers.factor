USING: assocs kernel locals math math.functions math.order sequences ;
IN: armstrong

:: digits ( x -- digits )
  x 10 /mod :> x! :> xs!
  1 { } new-resizable :> digits
  x digits push

  [ xs 0 = not ]
  [
    xs 10 /mod x! xs!
    x digits push
  ] while

  digits reverse ;

:: powsum ( x -- powsum )
  x digits :> digs
  digs length :> len

  digs [ len ^ ] map sum ;

: armstrong? ( x -- ? )
  [ ] [ powsum ] bi = ;

