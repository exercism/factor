module TwoFer

function gen_test_case(case)
    name = case["input"]["name"]
    expected = case["expected"]
    if isnothing(name)
        return """{ "$(expected)" } [ f 2-for-1 ] unit-test"""
    else
        return """{ "$(expected)" } [ "$(name)" 2-for-1 ] unit-test"""
    end
end

end
