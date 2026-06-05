module TwoBucket

function gen_test_case(case)
    b1 = case["input"]["bucketOne"]
    b2 = case["input"]["bucketTwo"]
    goal = case["input"]["goal"]
    start = case["input"]["startBucket"]
    expected = case["expected"]
    call = "$(b1) $(b2) $(goal) \"$(start)\" measure"
    if expected isa AbstractDict && haskey(expected, "error")
        return "[ $(call) ] [ goal-not-reachable? ] must-fail-with"
    end
    moves = expected["moves"]
    goal_bucket = expected["goalBucket"]
    other = expected["otherBucket"]
    return "{ $(moves) \"$(goal_bucket)\" $(other) }\n[ $(call) ] unit-test"
end

end
