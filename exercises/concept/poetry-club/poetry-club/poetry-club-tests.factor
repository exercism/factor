USING: exercism-tools kernel poetry-club tools.test ;
IN: poetry-club.tests

TASK: 1 new-club
{ "Dickinson" } [ { "Keats" "Byron" "Dickinson" } new-club "Dickinson" swap circle-of ] unit-test

STOP-HERE

{ "Keats" } [ { "Keats" "Byron" "Dickinson" } new-club "Keats" swap circle-of ] unit-test

TASK: 2 collaborate
{ t } [ { "Keats" "Byron" "Dickinson" } new-club "Keats" "Byron" rot collaborate
        [ "Keats" "Byron" ] dip same-circle? ] unit-test
{ f } [ { "Keats" "Byron" "Dickinson" } new-club "Keats" "Byron" rot collaborate
        [ "Keats" "Dickinson" ] dip same-circle? ] unit-test

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
