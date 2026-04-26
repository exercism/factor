module RobotSimulator

function format_robot(obj)
    x = Int(obj["position"]["x"])
    y = Int(obj["position"]["y"])
    dir = obj["direction"]
    return "T{ robot { x $(x) } { y $(y) } { direction $(dir) } }"
end

function gen_test_case(case)
    expected = format_robot(case["expected"])
    x = Int(case["input"]["position"]["x"])
    y = Int(case["input"]["position"]["y"])
    dir = case["input"]["direction"]
    if case["property"] == "create"
        return "{ $(expected) }\n[ $(x) $(y) $(dir) <robot> ] unit-test"
    else
        instructions = case["input"]["instructions"]
        return """{ $(expected) }\n[ $(x) $(y) $(dir) <robot> "$(instructions)" move ] unit-test"""
    end
end

end
