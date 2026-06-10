USING: exercism-tools grep io kernel tools.test unicode ;
IN: grep.tests

"One file, one match, no flags" description
{ { "Of Atreus, Agamemnon, King of men." } }
[ "Agamemnon" { } { "iliad.txt" } grep ]
unit-test

STOP-HERE

"One file, one match, print line numbers flag" description
{ { "2:Of that Forbidden Tree, whose mortal tast" } }
[ "Forbidden" { "-n" } { "paradise-lost.txt" } grep ]
unit-test

"One file, one match, case-insensitive flag" description
{ { "Of that Forbidden Tree, whose mortal tast" } }
[ "FORBIDDEN" { "-i" } { "paradise-lost.txt" } grep ]
unit-test

"One file, one match, print file names flag" description
{ { "paradise-lost.txt" } }
[ "Forbidden" { "-l" } { "paradise-lost.txt" } grep ]
unit-test

"One file, one match, match entire lines flag" description
{ { "With loss of Eden, till one greater Man" } }
[ "With loss of Eden, till one greater Man" { "-x" } { "paradise-lost.txt" } grep ]
unit-test

"One file, one match, multiple flags" description
{ { "9:Of Atreus, Agamemnon, King of men." } }
[ "OF ATREUS, Agamemnon, KIng of MEN." { "-n" "-i" "-x" } { "iliad.txt" } grep ]
unit-test

"One file, several matches, no flags" description
{ { "Nor how it may concern my modesty," "But I beseech your grace that I may know" "The worst that may befall me in this case," } }
[ "may" { } { "midsummer-night.txt" } grep ]
unit-test

"One file, several matches, print line numbers flag" description
{ { "3:Nor how it may concern my modesty," "5:But I beseech your grace that I may know" "6:The worst that may befall me in this case," } }
[ "may" { "-n" } { "midsummer-night.txt" } grep ]
unit-test

"One file, several matches, match entire lines flag" description
{ { } }
[ "may" { "-x" } { "midsummer-night.txt" } grep ]
unit-test

"One file, several matches, case-insensitive flag" description
{ { "Achilles sing, O Goddess! Peleus' son;" "The noble Chief Achilles from the son" } }
[ "ACHILLES" { "-i" } { "iliad.txt" } grep ]
unit-test

"One file, several matches, inverted flag" description
{ { "Brought Death into the World, and all our woe," "With loss of Eden, till one greater Man" "Restore us, and regain the blissful Seat," "Sing Heav'nly Muse, that on the secret top" "That Shepherd, who first taught the chosen Seed" } }
[ "Of" { "-v" } { "paradise-lost.txt" } grep ]
unit-test

"One file, no matches, various flags" description
{ { } }
[ "Gandalf" { "-n" "-l" "-x" "-i" } { "iliad.txt" } grep ]
unit-test

"One file, one match, file flag takes precedence over line flag" description
{ { "iliad.txt" } }
[ "ten" { "-n" "-l" } { "iliad.txt" } grep ]
unit-test

"One file, several matches, inverted and match entire lines flags" description
{ { "Achilles sing, O Goddess! Peleus' son;" "His wrath pernicious, who ten thousand woes" "Caused to Achaia's host, sent many a soul" "And Heroes gave (so stood the will of Jove)" "To dogs and to all ravening fowls a prey," "When fierce dispute had separated once" "The noble Chief Achilles from the son" "Of Atreus, Agamemnon, King of men." } }
[ "Illustrious into Ades premature," { "-x" "-v" } { "iliad.txt" } grep ]
unit-test

"Multiple files, one match, no flags" description
{ { "iliad.txt:Of Atreus, Agamemnon, King of men." } }
[ "Agamemnon" { } { "iliad.txt" "midsummer-night.txt" "paradise-lost.txt" } grep ]
unit-test

"Multiple files, several matches, no flags" description
{ { "midsummer-night.txt:Nor how it may concern my modesty," "midsummer-night.txt:But I beseech your grace that I may know" "midsummer-night.txt:The worst that may befall me in this case," } }
[ "may" { } { "iliad.txt" "midsummer-night.txt" "paradise-lost.txt" } grep ]
unit-test

"Multiple files, several matches, print line numbers flag" description
{ { "midsummer-night.txt:5:But I beseech your grace that I may know" "midsummer-night.txt:6:The worst that may befall me in this case," "paradise-lost.txt:2:Of that Forbidden Tree, whose mortal tast" "paradise-lost.txt:6:Sing Heav'nly Muse, that on the secret top" } }
[ "that" { "-n" } { "iliad.txt" "midsummer-night.txt" "paradise-lost.txt" } grep ]
unit-test

"Multiple files, one match, print file names flag" description
{ { "iliad.txt" "paradise-lost.txt" } }
[ "who" { "-l" } { "iliad.txt" "midsummer-night.txt" "paradise-lost.txt" } grep ]
unit-test

"Multiple files, several matches, case-insensitive flag" description
{ { "iliad.txt:Caused to Achaia's host, sent many a soul" "iliad.txt:Illustrious into Ades premature," "iliad.txt:And Heroes gave (so stood the will of Jove)" "iliad.txt:To dogs and to all ravening fowls a prey," "midsummer-night.txt:I do entreat your grace to pardon me." "midsummer-night.txt:In such a presence here to plead my thoughts;" "midsummer-night.txt:If I refuse to wed Demetrius." "paradise-lost.txt:Brought Death into the World, and all our woe," "paradise-lost.txt:Restore us, and regain the blissful Seat," "paradise-lost.txt:Sing Heav'nly Muse, that on the secret top" } }
[ "TO" { "-i" } { "iliad.txt" "midsummer-night.txt" "paradise-lost.txt" } grep ]
unit-test

"Multiple files, several matches, inverted flag" description
{ { "iliad.txt:Achilles sing, O Goddess! Peleus' son;" "iliad.txt:The noble Chief Achilles from the son" "midsummer-night.txt:If I refuse to wed Demetrius." } }
[ "a" { "-v" } { "iliad.txt" "midsummer-night.txt" "paradise-lost.txt" } grep ]
unit-test

"Multiple files, one match, match entire lines flag" description
{ { "midsummer-night.txt:But I beseech your grace that I may know" } }
[ "But I beseech your grace that I may know" { "-x" } { "iliad.txt" "midsummer-night.txt" "paradise-lost.txt" } grep ]
unit-test

"Multiple files, one match, multiple flags" description
{ { "paradise-lost.txt:4:With loss of Eden, till one greater Man" } }
[ "WITH LOSS OF EDEN, TILL ONE GREATER MAN" { "-n" "-i" "-x" } { "iliad.txt" "midsummer-night.txt" "paradise-lost.txt" } grep ]
unit-test

"Multiple files, no matches, various flags" description
{ { } }
[ "Frodo" { "-n" "-l" "-x" "-i" } { "iliad.txt" "midsummer-night.txt" "paradise-lost.txt" } grep ]
unit-test

"Multiple files, several matches, file flag takes precedence over line number flag" description
{ { "iliad.txt" "paradise-lost.txt" } }
[ "who" { "-n" "-l" } { "iliad.txt" "midsummer-night.txt" "paradise-lost.txt" } grep ]
unit-test

"Multiple files, several matches, inverted and match entire lines flags" description
{ { "iliad.txt:Achilles sing, O Goddess! Peleus' son;" "iliad.txt:His wrath pernicious, who ten thousand woes" "iliad.txt:Caused to Achaia's host, sent many a soul" "iliad.txt:And Heroes gave (so stood the will of Jove)" "iliad.txt:To dogs and to all ravening fowls a prey," "iliad.txt:When fierce dispute had separated once" "iliad.txt:The noble Chief Achilles from the son" "iliad.txt:Of Atreus, Agamemnon, King of men." "midsummer-night.txt:I do entreat your grace to pardon me." "midsummer-night.txt:I know not by what power I am made bold," "midsummer-night.txt:Nor how it may concern my modesty," "midsummer-night.txt:In such a presence here to plead my thoughts;" "midsummer-night.txt:But I beseech your grace that I may know" "midsummer-night.txt:The worst that may befall me in this case," "midsummer-night.txt:If I refuse to wed Demetrius." "paradise-lost.txt:Of Mans First Disobedience, and the Fruit" "paradise-lost.txt:Of that Forbidden Tree, whose mortal tast" "paradise-lost.txt:Brought Death into the World, and all our woe," "paradise-lost.txt:With loss of Eden, till one greater Man" "paradise-lost.txt:Restore us, and regain the blissful Seat," "paradise-lost.txt:Sing Heav'nly Muse, that on the secret top" "paradise-lost.txt:Of Oreb, or of Sinai, didst inspire" "paradise-lost.txt:That Shepherd, who first taught the chosen Seed" } }
[ "Illustrious into Ades premature," { "-x" "-v" } { "iliad.txt" "midsummer-night.txt" "paradise-lost.txt" } grep ]
unit-test
