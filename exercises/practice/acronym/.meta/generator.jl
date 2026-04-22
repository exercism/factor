module Acronym

function gen_test_case(case)
    phrase = escape_factor(case["input"]["phrase"])
    expected = case["expected"]
    return """{ "$(expected)" }\n[ "$(phrase)" abbreviate ] unit-test"""
end

end
