module RotationalCipher

function gen_test_case(case)
    text = escape_factor(case["input"]["text"])
    key = Int(case["input"]["shiftKey"])
    expected = escape_factor(case["expected"])
    return """{ "$(expected)" }\n[ "$(text)" $(key) rotate ] unit-test"""
end

end
