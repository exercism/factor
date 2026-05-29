module RomanNumerals

function gen_test_case(case)
    number = Int(case["input"]["number"])
    expected = case["expected"]
    return "{ \"$(expected)\" } [ $(number) roman ] unit-test"
end

end
