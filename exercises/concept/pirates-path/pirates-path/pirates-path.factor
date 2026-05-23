USING: kernel ;
IN: pirates-path

: tide-queue ( items -- popped )
    "unimplemented" throw ;

: coves-reachable ( start chart -- coves )
    "unimplemented" throw ;

: hop-count ( start goal chart -- n/f )
    "unimplemented" throw ;

! Task 4: declare `gold-count ( cove -- n )` with MEMO: so the
! result for each cove is computed once and cached. Look up the
! value from the `gold-distribution` constant below.

CONSTANT: gold-distribution H{
    { "Hidden Cove"        80 }
    { "Skull Bay"         120 }
    { "Reef Point"         40 }
    { "Smuggler's Hollow" 200 }
    { "Plank Island"       60 }
    { "Lantern Rock"      150 }
}

: treasure-route ( start chart -- best-cove )
    "unimplemented" throw ;
