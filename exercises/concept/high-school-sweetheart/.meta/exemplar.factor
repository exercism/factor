USING: ascii kernel sequences splitting strings ;
IN: high-school-sweetheart

: cleanupname ( name -- cleaned )
    "-" " " replace [ blank? ] trim ;

: firstletter ( name -- letter )
    cleanupname first 1string ;

: initial ( name -- initial )
    firstletter >upper "." append ;

: couple ( name1 name2 -- formatted )
    [ initial ] bi@
    "  +  " glue
    "\u{2764} " " \u{2764}" surround ;
