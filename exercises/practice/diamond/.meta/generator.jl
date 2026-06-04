module Diamond

function gen_test_case(case)
    letter = case["input"]["letter"]
    rows = case["expected"]
    if length(rows) == 1
        expected = format_string_array(rows)
        return "{ $(expected) }\n[ CHAR: $(letter) rows ] unit-test"
    end
    body = join(map(s -> "        \"$(escape_factor(s))\"", rows), "\n")
    expected = "{\n    {\n$(body)\n    }\n}"
    return "$(expected) [ CHAR: $(letter) rows ] unit-test"
end

end
