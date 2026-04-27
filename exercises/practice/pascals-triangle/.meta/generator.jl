module PascalsTriangle

function gen_test_case(case)
    count = to_int_str(case["input"]["count"])
    expected = case["expected"]
    rows = ["{ " * join(map(to_int_str, row), " ") * " }" for row in expected]
    expected_str = "{ $(join(rows, " ")) }"
    return "{ $(expected_str) }\n[ $(count) rows ] unit-test"
end

end
