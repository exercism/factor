module OcrNumbers

function gen_test_case(case)
    rows = format_string_array(case["input"]["rows"])
    expected = case["expected"]
    if expected isa Dict
        msg = expected["error"]
        return """[ $(rows) convert ]\n[ "$(msg)" = ] must-fail-with"""
    else
        return """{ "$(expected)" }\n[ $(rows) convert ] unit-test"""
    end
end

end
