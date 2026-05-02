USING: arrays bosuns-briefing.helpers kernel locals sequences
splitting ;
IN: bosuns-briefing

: roster ( names -- str ) [ crew-line ] map "\n" join ;

:: briefing ( names -- str )
    greeting names roster closing 3array "\n" join ;
