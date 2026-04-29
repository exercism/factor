module Change

function gen_test_case(case)
    coins = case["input"]["coins"]
    target = case["input"]["target"]
    expected = case["expected"]

    coins_str = isempty(coins) ? "HS{ }" : "HS{ " * join(coins, " ") * " }"

    if expected isa AbstractDict && haskey(expected, "error")
        return """[ $(coins_str) $(target) find-fewest-coins ] [ cannot-make-change? ] must-fail-with"""
    end

    expected_str = isempty(expected) ? "{ }" : "{ " * join(expected, " ") * " }"
    return """{ $(expected_str) }\n[ $(coins_str) $(target) find-fewest-coins ] unit-test"""
end

end
