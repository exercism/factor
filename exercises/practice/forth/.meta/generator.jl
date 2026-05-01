module Forth

const EXTRA_VOCABS = ["forth", "forth.builtins"]

const ERROR_PRED = Dict(
    "empty stack"               => "empty-stack?",
    "only one value on the stack" => "only-one-value-on-the-stack?",
    "divide by zero"            => "divide-by-zero?",
    "undefined operation"       => "undefined-operation?",
    "illegal operation"         => "illegal-operation?",
)

function gen_test_case(case)
    if case["property"] == "evaluateBoth"
        inp1 = format_string_array(case["input"]["instructionsFirst"])
        inp2 = format_string_array(case["input"]["instructionsSecond"])
        exp1 = format_int_array(case["expected"][1])
        exp2 = format_int_array(case["expected"][2])
        return "{ $exp1 $exp2 }\n[ $(inp1) evaluate $(inp2) evaluate ]\nunit-test"
    end
    inp = format_string_array(case["input"]["instructions"])
    exp = case["expected"]
    if exp isa AbstractDict && haskey(exp, "error")
        pred = ERROR_PRED[exp["error"]]
        return "[ $(inp) evaluate ] [ $(pred) ] must-fail-with"
    end
    "{ $(format_int_array(exp)) }\n[ $(inp) evaluate ]\nunit-test"
end

end
