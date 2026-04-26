module Triangle

function format_sides(sides)
    parts = map(sides) do s
        s == floor(s) ? string(Int(s)) : string(s)
    end
    return join(parts, " ")
end

function gen_test_case(case)
    sides = format_sides(case["input"]["sides"])
    prop = case["property"]
    expected = case["expected"] ? "t" : "f"
    return "{ $(expected) } [ $(sides) <triangle> $(prop)? ] unit-test"
end

end
