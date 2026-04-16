module AllYourBase

const HEADER = "USING: all-your-base tools.test ;"


function gen_test_case(case)
    digits = format_int_array(case["input"]["digits"])
    ib = case["input"]["inputBase"]
    ob = case["input"]["outputBase"]
    expected = case["expected"]
    if expected isa Dict
        msg = expected["error"]
        return """[ $(digits) $(ib) $(ob) rebase ] [ "$(msg)" = ] must-fail-with"""
    else
        exp_str = format_int_array(expected)
        return "{ $(exp_str) } [ $(digits) $(ib) $(ob) rebase ] unit-test"
    end
end

end
