module Bowling

const EXTRA_VOCABS = ["locals", "sequences"]
const EXTRA_HEADER = "FROM: bowling => roll ;"

function gen_test_case(case)
    input = case["input"]
    expected = case["expected"]

    body = String["<game> :> g"]
    previous = input["previousRolls"]
    if !isempty(previous)
        push!(body, "$(format_int_array(previous)) [ g roll ] each")
    end
    if haskey(input, "roll")
        push!(body, "$(to_int_str(input["roll"])) g roll")
    else
        push!(body, "g score")
    end
    body_str = join(body, "\n      ")

    if expected isa Dict
        msg = escape_factor(expected["error"])
        return """[
    [let $(body_str)
    ]
] [ "$(msg)" = ] must-fail-with"""
    else
        return """{ $(to_int_str(expected)) } [
    [let $(body_str)
    ]
] unit-test"""
    end
end

end
