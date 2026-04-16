module Leap

const HEADER = "USING: leap tools.test ;"

function gen_test_case(case)
    year = case["input"]["year"]
    expected = case["expected"] ? "t" : "f"
    return "{ $(expected) } [ $(year) leap-year? ] unit-test"
end

end
