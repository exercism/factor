module Sublist

function gen_test_case(case)
    list_one = format_int_array(case["input"]["listOne"])
    list_two = format_int_array(case["input"]["listTwo"])
    expected = case["expected"]
    return "{ \"$(expected)\" } [ $(list_one) $(list_two) relation ] unit-test"
end

end
