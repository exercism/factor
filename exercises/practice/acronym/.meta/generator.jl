module Acronym

const HEADER = "USING: acronym tools.test ;"


function gen_test_case(case)
    phrase = escape_factor(case["input"]["phrase"])
    expected = case["expected"]
    return """{ "$(expected)" } [ "$(phrase)" abbreviate ] unit-test"""
end

end
