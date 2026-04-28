USING: kernel sequences sorting unicode ;
IN: anagram

: sorted-lower ( str -- str' ) >lower sort ;

: anagram? ( subject candidate -- ? )
    2dup [ >lower ] bi@ = not
    -rot [ sorted-lower ] bi@ =
    and ;

: find-anagrams ( subject candidates -- anagrams )
    [ dupd anagram? ] filter nip ;
