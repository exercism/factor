module Gigasecond

function gen_test_case(case)
    input = escape_factor(case["input"]["moment"])
    expected = escape_factor(case["expected"])
    return "{ \"$(expected)\" }\n[ \"$(input)\" gigasecond-after ] unit-test"
end

end
