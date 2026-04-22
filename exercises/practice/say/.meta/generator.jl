module Say

function gen_test_case(case)
    number = case["input"]["number"]
    expected = case["expected"]
    if expected isa Dict
        msg = expected["error"]
        return """[ $(number) say ] [ "$(msg)" = ] must-fail-with"""
    else
        return """{ "$(expected)" }\n[ $(number) say ] unit-test"""
    end
end

end
