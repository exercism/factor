module ReverseString

const HEADER = "USING: reverse-string tools.test ;"


function gen_test_case(case)
    value = escape_factor(case["input"]["value"])
    expected = escape_factor(case["expected"])
    return """{ "$(expected)" } [ "$(value)" reverse-string ] unit-test"""
end

end
