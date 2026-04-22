module AllYourBase

function gen_test_case(case)
    digits = format_int_array(case["input"]["digits"])
    ib = case["input"]["inputBase"]
    ob = case["input"]["outputBase"]
    expected = case["expected"]
    if expected isa Dict
        msg = expected["error"]
        return """[ $(digits) $(ib) $(ob) rebase ]\n[ "$(msg)" = ] must-fail-with"""
    else
        exp_str = format_int_array(expected)
        return "{ $(exp_str) }\n[ $(digits) $(ib) $(ob) rebase ] unit-test"
    end
end

end
