module MatchingBrackets

function gen_test_case(case)
    value = escape_factor(case["input"]["value"])
    expected = case["expected"] ? "t" : "f"
    return """{ $(expected) } [ "$(value)" paired? ] unit-test"""
end

end
