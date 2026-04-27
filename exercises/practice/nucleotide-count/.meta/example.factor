USING: assocs kernel math sequences strings ;
IN: nucleotide-count

ERROR: invalid-nucleotide ;

: nucleotide-counts ( strand -- counts )
    dup [ "ACGT" member? ] all? [ invalid-nucleotide ] unless
    H{ { "A" 0 } { "C" 0 } { "G" 0 } { "T" 0 } } clone
    swap [ 1string over [ 1 + ] change-at ] each ;
