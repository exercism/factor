USING: accessors exercism-tools io kernel locals math
math.statistics regexp robot-name sequences sets tools.test ;
IN: robot-name.tests

"Robot Name:" print

: valid-name? ( str -- ? )
    R/ [A-Z]{2}\d{3}/ matches? ;

"name matches the [A-Z]{2}\\d{3} format" description
{ t } [
    <robot> name>> valid-name?
] unit-test

STOP-HERE

"name is stable across repeated lookups" description
{ t } [
    <robot> [ name>> ] [ name>> ] bi =
] unit-test

"two robots have different names" description
{ f } [
    <robot> name>>
    <robot> name>>
    =
] unit-test

"reset gives a name in the right format" description
{ t } [
    <robot> dup reset-name name>> valid-name?
] unit-test

"reset replaces the previous name" description
{ f } [
    [let <robot> :> r
        r name>>
        r reset-name
        r name>>
        =
    ]
] unit-test

! ----------------------------------------------------------------
! Distribution checks over 260 freshly generated names.
!
! 260 = 26 * 10, so the expected count per bin is 10 for the two
! letter positions (26 bins) and 26 for the three digit positions
! (10 bins). We run a chi-squared test on each position against a
! uniform null hypothesis. Critical thresholds are chosen high
! enough that a truly uniform generator essentially never fails:
! - letters (df = 25):  cutoff 80  (well above the chi-sq 10^-6 tail)
! - digits  (df =  9):  cutoff 50
!
! The per-position tests catch a generator whose values at any one
! position aren't uniform. They cannot catch a deterministic
! generator that cycles through values so each position is exactly
! uniform on its own. To catch that, we also test independence
! between positions by reducing each character to one bit (its
! parity) and chi-squaring the joint 5-bit distribution against
! uniform over 32 cells (df = 31, expected ~8.125 per cell).
!
! Both alphabets have an even number of symbols, so for any
! cycling-counter generator the parity of position p is a function
! of the underlying counter i. All five parities collapse to a
! function of i, the joint distribution piles onto a small subset
! of the 32 cells, and the chi-squared statistic blows up. The
! cutoff of 100 is well above the chi-sq 10^-9 tail for df = 31.
! ----------------------------------------------------------------

:: position-counts ( names i alphabet -- counts )
    alphabet [| ch | names [ i swap nth ch = ] count ] map ;

:: chi-squared-uniform ( counts expected -- chi2 )
    counts [ expected - sq expected /f ] map-sum ;

:: chi-squared-position ( names i alphabet -- chi2 )
    names i alphabet position-counts
    names length alphabet length /f
    chi-squared-uniform ;

: letter-alphabet ( -- seq )
    26 <iota> [ CHAR: A + ] map ;

: digit-alphabet ( -- seq )
    10 <iota> [ CHAR: 0 + ] map ;

: name-parity ( name -- n )
    0 [ 2 mod swap 2 * + ] reduce ;

:: parity-counts ( names -- counts )
    32 <iota> [| k | names [ name-parity k = ] count ] map ;

:: chi-squared-parity ( names -- chi2 )
    names parity-counts
    names length 32 /f
    chi-squared-uniform ;

"260 fresh robot names: all valid, all distinct, each position uniform, positions jointly independent" description
{ t 260 t t t t t t } [
    [let 260 [ <robot> name>> ] replicate :> names
        names [ valid-name? ] all?
        names members length
        names 0 letter-alphabet chi-squared-position 80 <
        names 1 letter-alphabet chi-squared-position 80 <
        names 2 digit-alphabet  chi-squared-position 50 <
        names 3 digit-alphabet  chi-squared-position 50 <
        names 4 digit-alphabet  chi-squared-position 50 <
        names chi-squared-parity 100 <
    ]
] unit-test
