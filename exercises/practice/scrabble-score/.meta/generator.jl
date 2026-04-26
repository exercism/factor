module ScrabbleScore

function gen_test_case(case)
    word = escape_factor(case["input"]["word"])
    expected = to_int_str(case["expected"])
    return """{ $(expected) }\n[ "$(word)" score ] unit-test"""
end

end
