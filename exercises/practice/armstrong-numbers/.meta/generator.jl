module ArmstrongNumbers

const HEADER = "USING: armstrong-numbers tools.test ;"

function gen_test_case(case)
    number = case["input"]["number"]
    expected = case["expected"] ? "t" : "f"
    return "{ $(expected) } [ $(Int(number)) armstrong-number? ] unit-test"
end

end
