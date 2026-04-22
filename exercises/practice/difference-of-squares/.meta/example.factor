USING: kernel math ranges sequences ;
IN: difference-of-squares

: square-of-sum ( n -- m )
    [1..b] sum sq ;

: sum-of-squares ( n -- m )
    [1..b] [ sq ] map-sum ;

: difference-of-squares ( n -- m )
    dup square-of-sum swap sum-of-squares - ;
