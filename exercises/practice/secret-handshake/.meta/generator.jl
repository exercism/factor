module SecretHandshake

function gen_test_case(case)
    number = to_int_str(case["input"]["number"])
    expected = case["expected"]
    actions = isempty(expected) ? "{ }" : format_string_array(expected)
    return "{ $(actions) }\n[ $(number) commands ] unit-test"
end

end
