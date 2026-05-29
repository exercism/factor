module Series

function escape(s)
    return replace(string(s), "\\" => "\\\\", "\"" => "\\\"")
end

function gen_test_case(case)
    series = escape(case["input"]["series"])
    len = Int(case["input"]["sliceLength"])
    expected = case["expected"]
    if expected isa Dict
        msg = escape(expected["error"])
        return """[ "$(series)" $(len) slices ] [ "$(msg)" = ] must-fail-with"""
    else
        items = join(["\"$(escape(s))\"" for s in expected], " ")
        return "{ { $(items) } } [ \"$(series)\" $(len) slices ] unit-test"
    end
end

end
