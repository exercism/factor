module SaveTheCow

function gen_test_case(case)
    word = escape_factor(case["input"]["word"])
    guesses = escape_factor(join(case["input"]["guesses"]))
    expected = case["expected"]
    if haskey(expected, "error")
        return "[ \"$(word)\" \"$(guesses)\" guess ] must-fail"
    else
        state = expected["state"]
        masked = escape_factor(expected["maskedWord"])
        remaining = to_int_str(expected["remainingFailures"])
        return "{ \"$(state)\" \"$(masked)\" $(remaining) } [ \"$(word)\" \"$(guesses)\" guess ] unit-test"
    end
end

end
