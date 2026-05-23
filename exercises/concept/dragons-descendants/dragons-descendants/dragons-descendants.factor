USING: kernel ;
IN: dragons-descendants

! Task 1: TUPLE: dragon with slots `name`, `color`, `age`
!         and a constructor `<dragon> ( name color age -- dragon )`

! Task 2: TUPLE: fire-dragon extending dragon, adding `flame-temp`
!         and `<fire-dragon> ( name color age flame-temp -- fd )`

! Task 3: TUPLE: ice-dragon extending dragon, adding `chill-temp`
!         and `<ice-dragon> ( name color age chill-temp -- id )`

! Task 4: TUPLE: volcano-dragon extending fire-dragon, adding `lava-volume`
!         and `<volcano-dragon> ( name color age flame-temp lava-volume -- vd )`

: age-dragon ( dragon -- )
    "unimplemented" throw ;
