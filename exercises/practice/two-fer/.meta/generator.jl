module TwoFer

const HEADER = "USING: two-fer tools.test ;"

function gen_test_case(case)
    name = case["input"]["name"]
    expected = case["expected"]
    if isnothing(name)
        return """{ "$(expected)" } [ f two-fer ] unit-test"""
    else
        return """{ "$(expected)" } [ "$(name)" two-fer ] unit-test"""
    end
end

end
