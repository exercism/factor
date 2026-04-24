module Rectangles

function gen_test_case(case)
    expected = Int(case["expected"])
    strings = case["input"]["strings"]
    if isempty(strings)
        strings_str = "{ }"
    else
        lines = map(s -> "    \"$(escape_factor(s))\"", strings)
        strings_str = "{\n" * join(lines, "\n") * "\n}"
    end
    return "{ $(expected) }\n[ $(strings_str) count-rectangles ] unit-test"
end

end
