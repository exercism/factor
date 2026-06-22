USING: disjoint-sets exercism-tools kernel poetry-club tools.test ;
IN: poetry-club.tests

TASK: 1 new-club
! every poet starts in a writing circle of their own
{ f } [ { "Keats" "Byron" "Dickinson" } new-club [ "Keats" "Byron" ] dip equiv? ] unit-test

STOP-HERE

{ f } [ { "Keats" "Byron" "Dickinson" } new-club [ "Byron" "Dickinson" ] dip equiv? ] unit-test

TASK: 2 collaborate
{ t } [ { "Keats" "Byron" "Dickinson" } new-club "Keats" "Byron" rot collaborate
        [ "Keats" "Byron" ] dip equiv? ] unit-test
{ f } [ { "Keats" "Byron" "Dickinson" } new-club "Keats" "Byron" rot collaborate
        [ "Keats" "Dickinson" ] dip equiv? ] unit-test

TASK: 3 circle-of
{ "Shelley" } [ { "Shelley" "Blake" } new-club "Shelley" swap circle-of ] unit-test
{ t } [ { "Keats" "Byron" "Dickinson" } new-club "Keats" "Byron" rot collaborate
        [ "Keats" swap circle-of ] [ "Byron" swap circle-of ] bi = ] unit-test

TASK: 4 same-circle?
{ t } [ { "Keats" "Byron" "Dickinson" } new-club "Keats" "Byron" rot collaborate
        [ "Byron" "Keats" ] dip same-circle? ] unit-test
{ f } [ { "Keats" "Byron" "Dickinson" } new-club "Keats" "Byron" rot collaborate
        [ "Byron" "Dickinson" ] dip same-circle? ] unit-test
{ t } [ { "Keats" "Byron" "Shelley" "Blake" } new-club
        "Keats" "Byron" rot collaborate "Byron" "Shelley" rot collaborate
        [ "Keats" "Shelley" ] dip same-circle? ] unit-test
{ f } [ { "Keats" "Byron" "Shelley" "Blake" } new-club
        "Keats" "Byron" rot collaborate "Shelley" "Blake" rot collaborate
        [ "Keats" "Blake" ] dip same-circle? ] unit-test
