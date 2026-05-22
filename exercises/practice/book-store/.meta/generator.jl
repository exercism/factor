module BookStore

function gen_test_case(case)
    basket = format_int_array(case["input"]["basket"])
    expected = to_int_str(case["expected"])
    return "{ $(expected) }\n[ $(basket) total ] unit-test"
end

end
