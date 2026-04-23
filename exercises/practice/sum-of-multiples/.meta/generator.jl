module SumOfMultiples

function gen_test_case(case)
    factors = format_int_array(case["input"]["factors"])
    limit = Int(case["input"]["limit"])
    expected = Int(case["expected"])
    return "{ $(expected) } [ $(factors) $(limit) sum-of-multiples ] unit-test"
end

end
