module AffineCipher

function gen_test_case(case)
    phrase = escape_factor(case["input"]["phrase"])
    a = Int(case["input"]["key"]["a"])
    b = Int(case["input"]["key"]["b"])
    prop = case["property"]
    expected = case["expected"]
    if expected isa Dict
        msg = expected["error"]
        return """[ "$(phrase)" $(a) $(b) $(prop) ]\n[ "$(msg)" = ] must-fail-with"""
    else
        return """{ "$(expected)" }\n[ "$(phrase)" $(a) $(b) $(prop) ] unit-test"""
    end
end

end
