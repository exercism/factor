module ArmstrongNumbers

function gen_test_case(case)
    number = case["input"]["number"]
    expected = case["expected"] ? "t" : "f"
    return "{ $(expected) } [ $(Int(number)) armstrong? ] unit-test"
end

end
