module Proverb

function gen_test_case(case)
    strings = case["input"]["strings"]
    expected = case["expected"]
    input = format_string_array(strings)
    output = format_string_array(expected)
    return "{ $(output) }\n[ $(input) recite ] unit-test"
end

end
