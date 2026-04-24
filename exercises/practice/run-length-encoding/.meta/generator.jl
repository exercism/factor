module RunLengthEncoding

function gen_test_case(case)
    str = case["input"]["string"]
    expected = case["expected"]
    prop = case["property"]
    if prop == "consistency"
        return """{ "$(expected)" }\n[ "$(str)" encode decode ] unit-test"""
    else
        return """{ "$(expected)" }\n[ "$(str)" $(prop) ] unit-test"""
    end
end

end
