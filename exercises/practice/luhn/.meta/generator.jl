module Luhn

function gen_test_case(case)
    value = case["input"]["value"]
    expected = case["expected"] ? "t" : "f"
    return """{ $(expected) } [ "$(value)" valid? ] unit-test"""
end

end
