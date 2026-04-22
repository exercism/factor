module Pangram

function gen_test_case(case)
    sentence = escape_factor(case["input"]["sentence"])
    expected = case["expected"] ? "t" : "f"
    return """{ $(expected) } [ "$(sentence)" pangram? ] unit-test"""
end

end
