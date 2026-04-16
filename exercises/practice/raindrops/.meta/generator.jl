module Raindrops

const HEADER = "USING: raindrops tools.test ;"

function gen_test_case(case)
    number = case["input"]["number"]
    expected = case["expected"]
    return """{ "$(expected)" } [ $(number) convert ] unit-test"""
end

end
