module HighScores

function gen_test_case(case)
    scores = format_int_array(case["input"]["scores"])
    expected = case["expected"]
    expected_str = expected isa AbstractVector ? format_int_array(expected) : to_int_str(expected)
    property = case["property"]
    setup = "$(scores) <high-scores>"
    call = if property == "scores"
        "$(setup) scores"
    elseif property == "latest"
        "$(setup) latest"
    elseif property == "personalBest"
        "$(setup) personal-best"
    elseif property == "personalTopThree"
        "$(setup) personal-top-three"
    elseif property == "latestAfterTopThree"
        "$(setup) dup personal-top-three drop latest"
    elseif property == "scoresAfterTopThree"
        "$(setup) dup personal-top-three drop scores"
    elseif property == "latestAfterBest"
        "$(setup) dup personal-best drop latest"
    elseif property == "scoresAfterBest"
        "$(setup) dup personal-best drop scores"
    else
        error("Unknown property: $(property)")
    end
    return "{ $(expected_str) }\n[ $(call) ] unit-test"
end

end
