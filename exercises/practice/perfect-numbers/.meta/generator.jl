module PerfectNumbers

function gen_test_case(case)
    raw = case["input"]["number"]
    number = raw isa AbstractFloat ? string(BigInt(round(raw))) : string(Int(raw))
    expected = case["expected"]
    if expected isa Dict
        msg = expected["error"]
        return """[ $(number) classify ] [ "$(msg)" = ] must-fail-with"""
    else
        return """{ "$(expected)" } [ $(number) classify ] unit-test"""
    end
end

end
