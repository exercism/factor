module PhoneNumber

function gen_test_case(case)
    phrase = escape_factor(case["input"]["phrase"])
    expected = case["expected"]
    if expected isa AbstractDict && haskey(expected, "error")
        return """[ "$(phrase)" clean ] [ invalid-phone-number? ] must-fail-with"""
    end
    return """{ "$(escape_factor(expected))" }\n[ "$(phrase)" clean ] unit-test"""
end

end
