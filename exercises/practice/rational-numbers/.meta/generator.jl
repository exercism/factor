module RationalNumbers

const EXTRA_VOCABS = ["math"]

float_factor(f) = f isa Integer ? "$(f).0" : string(f)

function pair_word(prop)
    Dict("add" => "r+", "sub" => "r-", "mul" => "r*",
         "div" => "r/")[prop]
end

function gen_test_case(case)
    prop = case["property"]
    inp = case["input"]
    exp = case["expected"]

    if prop in ("add", "sub", "mul", "div")
        word = pair_word(prop)
        return "{ $(format_int_array(exp)) }\n[ $(format_int_array(inp["r1"])) >rat $(format_int_array(inp["r2"])) >rat $(word) rat>pair ]\nunit-test"
    elseif prop == "abs"
        return "{ $(format_int_array(exp)) }\n[ $(format_int_array(inp["r"])) >rat r-abs rat>pair ]\nunit-test"
    elseif prop == "reduce"
        return "{ $(format_int_array(exp)) }\n[ $(format_int_array(inp["r"])) >rat rat>pair ]\nunit-test"
    elseif prop == "exprational"
        return "{ $(format_int_array(exp)) }\n[ $(format_int_array(inp["r"])) >rat $(to_int_str(inp["n"])) r^ rat>pair ]\nunit-test"
    elseif prop == "expreal"
        return "{ t }\n[ $(to_int_str(inp["x"])) $(format_int_array(inp["r"])) >rat real^r $(float_factor(exp)) - abs 1e-9 < ]\nunit-test"
    end
    error("Unknown property: $prop")
end

end
