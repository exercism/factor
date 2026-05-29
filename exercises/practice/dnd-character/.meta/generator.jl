module DndCharacter

const EXTRA_VOCABS = [
    "accessors", "assocs", "combinators.short-circuit",
    "math", "math.order", "math.statistics", "sequences",
]

# Test-only helpers. The randomness cases from problem-specifications are
# replaced (via tests.toml + supplements.json) with stronger statistical
# tests: a validity check over many characters and a chi-squared
# goodness-of-fit against the exact 4d6-drop-lowest distribution.
const EXTRA_HEADER = """
CONSTANT: ability-frequencies
    { 1 4 10 21 38 62 91 122 148 167 172 160 131 94 54 21 }

:: ability-counts ( samples -- counts )
    samples histogram :> h
    16 <iota> [ 3 + h at 0 or ] map ;

: cell-chi2 ( observed expected -- x ) [ - sq ] [ nip ] 2bi /f ;

:: ability-chi-squared ( n -- chi2 )
    n [ ability ] replicate ability-counts
    ability-frequencies [ n 1296 / * ] map
    [ cell-chi2 ] 2map sum ;

: valid-ability? ( score -- ? ) 3 18 between? ;

: valid-character? ( character -- ? )
    {
        [ strength>> valid-ability? ]
        [ dexterity>> valid-ability? ]
        [ constitution>> valid-ability? ]
        [ intelligence>> valid-ability? ]
        [ wisdom>> valid-ability? ]
        [ charisma>> valid-ability? ]
        [ [ hitpoints>> ] [ constitution>> modifier 10 + ] bi = ]
    } 1&& ;
"""

function gen_test_case(case)
    p = case["property"]
    if p == "modifier"
        return "{ $(case["expected"]) } [ $(case["input"]["score"]) modifier ] unit-test"
    elseif p == "range"
        return "{ t } [ 1000 [ ability ] replicate [ valid-ability? ] all? ] unit-test"
    elseif p == "valid"
        return "{ t } [ 1000 [ <character> ] replicate [ valid-character? ] all? ] unit-test"
    elseif p == "stable"
        return "{ t } [ <character> [ strength>> ] [ strength>> ] bi = ] unit-test"
    elseif p == "distribution"
        return "{ t } [ 12960 ability-chi-squared 80 < ] unit-test"
    else
        error("unknown property: " * p)
    end
end

end
