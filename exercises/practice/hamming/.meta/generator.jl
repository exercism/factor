module Hamming

function gen_test_case(case)
    s1 = case["input"]["strand1"]
    s2 = case["input"]["strand2"]
    expected = case["expected"]
    if expected isa Dict
        msg = expected["error"]
        return """[ "$(s1)" "$(s2)" distance ] [ "$(msg)" = ] must-fail-with"""
    else
        return """{ $(expected) } [ "$(s1)" "$(s2)" distance ] unit-test"""
    end
end

end
