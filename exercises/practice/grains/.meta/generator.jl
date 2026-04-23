module Grains

function gen_test_case(case)
    prop = case["property"]
    expected = case["expected"]
    if prop == "total"
        return "{ 18446744073709551615 } [ total ] unit-test"
    elseif expected isa Dict
        msg = expected["error"]
        sq = Int(case["input"]["square"])
        return """[ $(sq) square ] [ "$(msg)" = ] must-fail-with"""
    else
        sq = Int(case["input"]["square"])
        grains = BigInt(2)^(sq-1)
        return "{ $(grains) } [ $(sq) square ] unit-test"
    end
end

end
