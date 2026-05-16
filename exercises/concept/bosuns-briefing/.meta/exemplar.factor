USING: arrays bosuns-briefing.helpers kernel sequences splitting ;
IN: bosuns-briefing

: roster ( names -- str ) [ crew-line ] map "\n" join ;

: briefing ( names -- str )
    [ greeting ] dip roster closing 3array "\n" join ;
