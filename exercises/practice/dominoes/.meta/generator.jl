module Dominoes

function encode_domino(d)
    a = Int(d[1])
    b = Int(d[2])
    return "0x" * string(a, base=16) * string(b, base=16)
end

function format_dominoes(dominoes)
    parts = map(encode_domino, dominoes)
    return "{ $(join(parts, " ")) }"
end

function gen_test_case(case)
    dominoes = case["input"]["dominoes"]
    expected = case["expected"] ? "t" : "f"
    arr = isempty(dominoes) ? "{ }" : format_dominoes(dominoes)
    return "{ $(expected) } [ $(arr) can-chain? ] unit-test"
end

end
