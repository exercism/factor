USING: kernel ;
IN: grep

! `grep` receives the search string, an array of flag strings
! (any of "-n", "-l", "-i", "-v", "-x"), and an array of file
! names. Read each file in turn, find the matching lines, and
! return them as an array of strings.
!
! Reading a file's lines: `<file-name> utf8 file-lines` (from the
! `io.files` and `io.encodings.utf8` vocabularies).

: grep ( pattern flags files -- lines )
    "unimplemented" throw ;
