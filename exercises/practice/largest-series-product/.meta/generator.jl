module LargestSeriesProduct

function gen_test_case(case)
    digits = escape_factor(case["input"]["digits"])
    span = to_int_str(case["input"]["span"])
    expected = case["expected"]
    if expected isa AbstractDict && haskey(expected, "error")
        return """[ "$(digits)" $(span) largest-product ] [ invalid-input? ] must-fail-with"""
    end
    return """{ $(to_int_str(expected)) }\n[ "$(digits)" $(span) largest-product ] unit-test"""
end

end
