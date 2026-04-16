module Isogram

const HEADER = "USING: isogram tools.test ;"

function gen_test_case(case)
    phrase = case["input"]["phrase"]
    expected = case["expected"] ? "t" : "f"
    return """{ $(expected) } [ "$(phrase)" isogram? ] unit-test"""
end

end
