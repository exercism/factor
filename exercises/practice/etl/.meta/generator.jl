module Etl

function format_legacy(legacy)
    pairs = map(sort(collect(legacy), by=x -> parse(Int, string(x[1])))) do (score, letters)
        letters_str = join(map(l -> "\"$(l)\"", letters), " ")
        "{ $(parse(Int, string(score))) { $(letters_str) } }"
    end
    return "H{ $(join(pairs, " ")) }"
end

function format_expected(expected)
    pairs = map(sort(collect(expected), by=first)) do (letter, score)
        "{ \"$(letter)\" $(Int(score)) }"
    end
    return "H{ $(join(pairs, " ")) }"
end

function gen_test_case(case)
    legacy = format_legacy(case["input"]["legacy"])
    expected = format_expected(case["expected"])
    return """{ $(expected) }\n[ $(legacy) transform ] unit-test"""
end

end
