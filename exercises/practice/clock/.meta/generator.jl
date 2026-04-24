module Clock

function gen_test_case(case)
    prop = case["property"]
    expected = case["expected"]
    if prop == "create"
        h = Int(case["input"]["hour"])
        m = Int(case["input"]["minute"])
        return """{ "$(expected)" } [ $(h) $(m) <clock> ] unit-test"""
    elseif prop == "add"
        h = Int(case["input"]["hour"])
        m = Int(case["input"]["minute"])
        v = Int(case["input"]["value"])
        return """{ "$(expected)" } [ $(h) $(m) <clock> $(v) add-minutes ] unit-test"""
    elseif prop == "subtract"
        h = Int(case["input"]["hour"])
        m = Int(case["input"]["minute"])
        v = Int(case["input"]["value"])
        return """{ "$(expected)" } [ $(h) $(m) <clock> $(v) subtract-minutes ] unit-test"""
    else  # equal
        h1 = Int(case["input"]["clock1"]["hour"])
        m1 = Int(case["input"]["clock1"]["minute"])
        h2 = Int(case["input"]["clock2"]["hour"])
        m2 = Int(case["input"]["clock2"]["minute"])
        exp = expected ? "t" : "f"
        return "{ $(exp) } [ $(h1) $(m1) <clock> $(h2) $(m2) <clock> clock= ] unit-test"
    end
end

end
