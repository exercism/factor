USING: arrays kernel locals math ranges sequences ;
IN: pythagorean-triplet

! For a+b+c=n and a²+b²=c², substituting c=n-a-b:
! b = n(n-2a) / (2(n-a)), then c = n-a-b
! Valid when b is a positive integer and a <= b < c

:: triplets-with-sum ( n -- triplets )
    V{ } clone :> results
    1 n 3 /i [a..b] [| a |
        n n a 2 * - * :> num
        2 n a - * :> den
        num den mod 0 = [
            num den /i :> b
            n a - b - :> c
            a b <= b c < and [
                a b c 3array results push
            ] when
        ] when
    ] each
    results >array ;
