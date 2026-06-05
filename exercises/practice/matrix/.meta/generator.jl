module Matrix

function gen_test_case(case)
    str = "\"$(escape_factor(case["input"]["string"]))\""
    idx = Int(case["input"]["index"])
    expected = format_int_array(case["expected"])
    word = case["property"] == "row" ? "nth-row" : "nth-column"
    return "{ $(expected) } [ $(str) $(idx) $(word) ] unit-test"
end

end
