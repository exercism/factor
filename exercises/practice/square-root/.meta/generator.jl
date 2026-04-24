module SquareRoot

function gen_test_case(case)
    radicand = Int(case["input"]["radicand"])
    expected = Int(case["expected"])
    return "{ $(expected) } [ $(radicand) square-root ] unit-test"
end

end
