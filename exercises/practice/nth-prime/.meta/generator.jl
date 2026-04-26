module NthPrime

function gen_test_case(case)
    number = Int(case["input"]["number"])
    expected = case["expected"]
    if expected isa Dict
        msg = expected["error"]
        return """[ $(number) nth-prime ]\n[ "$(msg)" = ] must-fail-with"""
    else
        return "{ $(Int(expected)) }\n[ $(number) nth-prime ] unit-test"
    end
end

end
