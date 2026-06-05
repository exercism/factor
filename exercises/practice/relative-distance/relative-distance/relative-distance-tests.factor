USING: exercism-tools io kernel relative-distance tools.test unicode ;
IN: relative-distance.tests

"Direct parent-child relation" description
{ 1 }
[
    H{
        { "Tomoko" { "Aditi" } }
        { "Vera" { "Tomoko" } }
    }
    "Vera" "Tomoko" degree-of-separation
] unit-test

STOP-HERE

"Sibling relationship" description
{ 1 }
[
    H{
        { "Dalia" { "Olga" "Yassin" } }
    }
    "Olga" "Yassin" degree-of-separation
] unit-test

"Two degrees of separation, grandchild" description
{ 2 }
[
    H{
        { "Khadija" { "Mateo" } }
        { "Mateo" { "Rami" } }
    }
    "Khadija" "Rami" degree-of-separation
] unit-test

"Unrelated individuals" description
{ f }
[
    H{
        { "Kaito" { "Elif" } }
        { "Priya" { "Rami" } }
    }
    "Priya" "Kaito" degree-of-separation
] unit-test

"Complex graph, cousins" description
{ 9 }
[
    H{
        { "Aditi" { "Nia" } }
        { "Aiko" { "Bao" "Carlos" } }
        { "Bao" { "Dalia" "Elias" } }
        { "Boris" { "Oscar" } }
        { "Carlos" { "Fatima" "Gustavo" } }
        { "Celine" { "Priya" } }
        { "Dalia" { "Hassan" "Isla" } }
        { "Diego" { "Qi" } }
        { "Elias" { "Javier" } }
        { "Elif" { "Rami" } }
        { "Farah" { "Sven" } }
        { "Fatima" { "Khadija" "Liam" } }
        { "Giorgio" { "Tomoko" } }
        { "Gustavo" { "Mina" } }
        { "Hana" { "Umar" } }
        { "Hassan" { "Noah" "Olga" } }
        { "Ian" { "Vera" } }
        { "Isla" { "Pedro" } }
        { "Javier" { "Quynh" "Ravi" } }
        { "Jing" { "Wyatt" } }
        { "Kaito" { "Xia" } }
        { "Khadija" { "Sofia" } }
        { "Leila" { "Yassin" } }
        { "Liam" { "Tariq" "Uma" } }
        { "Mateo" { "Zara" } }
        { "Mina" { "Viktor" "Wang" } }
        { "Nia" { "Antonio" } }
        { "Noah" { "Xiomara" } }
        { "Olga" { "Yuki" } }
        { "Oscar" { "Bianca" } }
        { "Pedro" { "Zane" "Aditi" } }
        { "Priya" { "Cai" } }
        { "Qi" { "Dimitri" } }
        { "Quynh" { "Boris" } }
        { "Rami" { "Ewa" } }
        { "Ravi" { "Celine" } }
        { "Sofia" { "Diego" "Elif" } }
        { "Sven" { "Fabio" } }
        { "Tariq" { "Farah" } }
        { "Tomoko" { "Gabriela" } }
        { "Uma" { "Giorgio" } }
        { "Umar" { "Helena" } }
        { "Vera" { "Igor" } }
        { "Viktor" { "Hana" "Ian" } }
        { "Wang" { "Jing" } }
        { "Wyatt" { "Jun" } }
        { "Xia" { "Kim" } }
        { "Xiomara" { "Kaito" } }
        { "Yassin" { "Lucia" } }
        { "Yuki" { "Leila" } }
        { "Zane" { "Mateo" } }
        { "Zara" { "Mohammed" } }
    }
    "Dimitri" "Fabio" degree-of-separation
] unit-test

"Complex graph, no shortcut, far removed nephew" description
{ 14 }
[
    H{
        { "Aditi" { "Nia" } }
        { "Aiko" { "Bao" "Carlos" } }
        { "Bao" { "Dalia" "Elias" } }
        { "Boris" { "Oscar" } }
        { "Carlos" { "Fatima" "Gustavo" } }
        { "Celine" { "Priya" } }
        { "Dalia" { "Hassan" "Isla" } }
        { "Diego" { "Qi" } }
        { "Elias" { "Javier" } }
        { "Elif" { "Rami" } }
        { "Farah" { "Sven" } }
        { "Fatima" { "Khadija" "Liam" } }
        { "Giorgio" { "Tomoko" } }
        { "Gustavo" { "Mina" } }
        { "Hana" { "Umar" } }
        { "Hassan" { "Noah" "Olga" } }
        { "Ian" { "Vera" } }
        { "Isla" { "Pedro" } }
        { "Javier" { "Quynh" "Ravi" } }
        { "Jing" { "Wyatt" } }
        { "Kaito" { "Xia" } }
        { "Khadija" { "Sofia" } }
        { "Leila" { "Yassin" } }
        { "Liam" { "Tariq" "Uma" } }
        { "Mateo" { "Zara" } }
        { "Mina" { "Viktor" "Wang" } }
        { "Nia" { "Antonio" } }
        { "Noah" { "Xiomara" } }
        { "Olga" { "Yuki" } }
        { "Oscar" { "Bianca" } }
        { "Pedro" { "Zane" "Aditi" } }
        { "Priya" { "Cai" } }
        { "Qi" { "Dimitri" } }
        { "Quynh" { "Boris" } }
        { "Rami" { "Ewa" } }
        { "Ravi" { "Celine" } }
        { "Sofia" { "Diego" "Elif" } }
        { "Sven" { "Fabio" } }
        { "Tariq" { "Farah" } }
        { "Tomoko" { "Gabriela" } }
        { "Uma" { "Giorgio" } }
        { "Umar" { "Helena" } }
        { "Vera" { "Igor" } }
        { "Viktor" { "Hana" "Ian" } }
        { "Wang" { "Jing" } }
        { "Wyatt" { "Jun" } }
        { "Xia" { "Kim" } }
        { "Xiomara" { "Kaito" } }
        { "Yassin" { "Lucia" } }
        { "Yuki" { "Leila" } }
        { "Zane" { "Mateo" } }
        { "Zara" { "Mohammed" } }
    }
    "Lucia" "Jun" degree-of-separation
] unit-test

"Complex graph, some shortcuts, cross-down and cross-up, cousins several times removed, with unrelated family tree" description
{ 12 }
[
    H{
        { "Aditi" { "Nia" } }
        { "Aiko" { "Bao" "Carlos" } }
        { "Bao" { "Dalia" } }
        { "Boris" { "Oscar" } }
        { "Carlos" { "Fatima" "Gustavo" } }
        { "Celine" { "Priya" } }
        { "Dalia" { "Hassan" "Isla" } }
        { "Diego" { "Qi" } }
        { "Elif" { "Rami" } }
        { "Farah" { "Sven" } }
        { "Fatima" { "Khadija" "Liam" } }
        { "Giorgio" { "Tomoko" } }
        { "Gustavo" { "Mina" } }
        { "Hana" { "Umar" } }
        { "Hassan" { "Noah" "Olga" } }
        { "Ian" { "Vera" } }
        { "Isla" { "Pedro" } }
        { "Javier" { "Quynh" "Ravi" } }
        { "Jing" { "Wyatt" } }
        { "Kaito" { "Xia" } }
        { "Khadija" { "Sofia" } }
        { "Leila" { "Yassin" } }
        { "Liam" { "Tariq" "Uma" } }
        { "Mateo" { "Zara" } }
        { "Mina" { "Viktor" "Wang" } }
        { "Nia" { "Antonio" } }
        { "Noah" { "Xiomara" } }
        { "Olga" { "Yuki" } }
        { "Oscar" { "Bianca" } }
        { "Pedro" { "Zane" "Aditi" } }
        { "Priya" { "Cai" } }
        { "Qi" { "Dimitri" } }
        { "Quynh" { "Boris" } }
        { "Rami" { "Ewa" } }
        { "Ravi" { "Celine" } }
        { "Sofia" { "Diego" "Elif" } }
        { "Sven" { "Fabio" } }
        { "Tariq" { "Farah" } }
        { "Tomoko" { "Gabriela" } }
        { "Uma" { "Giorgio" } }
        { "Umar" { "Helena" } }
        { "Vera" { "Igor" } }
        { "Viktor" { "Hana" "Ian" } }
        { "Wang" { "Jing" } }
        { "Wyatt" { "Jun" } }
        { "Xia" { "Kim" } }
        { "Xiomara" { "Kaito" } }
        { "Yassin" { "Lucia" } }
        { "Yuki" { "Leila" } }
        { "Zane" { "Mateo" } }
        { "Zara" { "Mohammed" } }
    }
    "Wyatt" "Xia" degree-of-separation
] unit-test
