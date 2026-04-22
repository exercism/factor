module Bob

function gen_test_case(case)
    input = escape_factor(case["input"]["heyBob"])
    expected = case["expected"]
    return """{ "$(expected)" }\n[ "$(input)" response ] unit-test"""
end

end
