module Wordy

function gen_test_case(case)
    question = escape_factor(case["input"]["question"])
    expected = case["expected"]
    # Both "unknown operation" and "syntax error" map to a single error.
    if expected isa AbstractDict && haskey(expected, "error")
        return "[ \"$(question)\" answer ] [ invalid-question? ] must-fail-with"
    end
    return "{ $(expected) } [ \"$(question)\" answer ] unit-test"
end

end
