module Diamond

function gen_test_case(case)
    letter = case["input"]["letter"]
    expected = format_string_array(case["expected"])
    return "{ $(expected) }\n[ CHAR: $(letter) rows ] unit-test"
end

end
