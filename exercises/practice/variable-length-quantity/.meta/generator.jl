module VariableLengthQuantity

const EXTRA_VOCABS = ["sequences"]

function gen_test_case(case)
    word = case["property"] == "encode" ? "encode" : "decode"
    input = format_int_array(case["input"]["integers"])
    expected = case["expected"]
    if expected isa Dict
        msg = expected["error"]
        return """[ $(input) $(word) ] [ "$(msg)" = ] must-fail-with"""
    else
        return "{ $(format_int_array(expected)) }\n[ $(input) $(word) ] unit-test"
    end
end

end
