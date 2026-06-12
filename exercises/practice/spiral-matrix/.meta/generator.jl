module SpiralMatrix

function gen_test_case(case)
    n = case["input"]["size"]
    matrix = case["expected"]
    if isempty(matrix)
        expected = "{ { } }"
    else
        rows = join(map(r -> "        $(format_int_array(r))", matrix), "\n")
        expected = "{\n    {\n$(rows)\n    }\n}"
    end
    return "$(expected)\n[ $(n) spiral-matrix ] unit-test"
end

end
