USING: kernel sequences ;
IN: bosuns-briefing.helpers

: greeting ( -- str ) "All hands, attention!" ;

: crew-line ( name -- str ) "  - " swap append ;

: closing ( -- str ) "Carry on." ;
