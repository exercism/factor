USING: kernel math math.order sequences ;
IN: micro-blog

: truncate ( str -- str' )
    5 over length min head ;
