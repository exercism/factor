module BinarySearch

function gen_test_case(case)
    array = format_int_array(case["input"]["array"])
    value = to_int_str(case["input"]["value"])
    expected = case["expected"]
    if expected isa AbstractDict && haskey(expected, "error")
        return """[ $(array) $(value) find ] [ value-not-in-array? ] must-fail-with"""
    end
    return "{ $(to_int_str(expected)) }\n[ $(array) $(value) find ] unit-test"
end

end
