module CollatzConjecture

function gen_test_case(case)
    number = Int(case["input"]["number"])
    expected = case["expected"]
    if expected isa Dict
        msg = expected["error"]
        return """[ $(number) steps ] [ "$(msg)" = ] must-fail-with"""
    else
        return "{ $(Int(expected)) } [ $(number) steps ] unit-test"
    end
end

end
