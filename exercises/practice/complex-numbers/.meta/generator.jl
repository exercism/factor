module ComplexNumbers

const EXTRA_VOCABS = ["accessors", "arrays", "math",
                      "math.constants", "math.functions",
                      "sequences"]

function num_factor(x)
    if x isa AbstractFloat
        return string(x)
    elseif x isa Integer
        return string(x)
    elseif x isa AbstractString
        x == "pi"      && return "pi"
        x == "-pi"     && return "pi neg"
        x == "e"       && return "e"
        x == "-e"      && return "e neg"
        x == "ln(2)"   && return "2 log"
        x == "ln(2)/2" && return "2 log 2 /"
        x == "pi/4"    && return "pi 4 /"
        error("unknown symbolic: $x")
    end
    error("unknown number type: $(typeof(x))")
end

z_factor(z) = "$(num_factor(z[1])) $(num_factor(z[2])) <cmplx>"
expected_pair_factor(arr) = "$(num_factor(arr[1])) $(num_factor(arr[2])) 2array"

const ARITH_WORD = Dict("add" => "c+", "sub" => "c-",
                        "mul" => "c*", "div" => "c/")

function gen_test_case(case)
    prop = case["property"]
    inp = case["input"]
    exp = case["expected"]

    if haskey(ARITH_WORD, prop)
        word = ARITH_WORD[prop]
        return "{ t }\n[ $(z_factor(inp["z1"])) $(z_factor(inp["z2"])) $(word) cmplx>pair\n  $(expected_pair_factor(exp)) [ - abs 1e-9 < ] 2all? ]\nunit-test"
    elseif prop == "abs"
        return "{ t }\n[ $(z_factor(inp["z"])) c-abs $(num_factor(exp)) - abs 1e-9 < ]\nunit-test"
    elseif prop == "real"
        return "{ $(num_factor(exp)) }\n[ $(z_factor(inp["z"])) real>> ]\nunit-test"
    elseif prop == "imaginary"
        return "{ $(num_factor(exp)) }\n[ $(z_factor(inp["z"])) imaginary>> ]\nunit-test"
    elseif prop == "conjugate"
        return "{ t }\n[ $(z_factor(inp["z"])) c-conj cmplx>pair\n  $(expected_pair_factor(exp)) [ - abs 1e-9 < ] 2all? ]\nunit-test"
    elseif prop == "exp"
        return "{ t }\n[ $(z_factor(inp["z"])) c-exp cmplx>pair\n  $(expected_pair_factor(exp)) [ - abs 1e-9 < ] 2all? ]\nunit-test"
    end
    error("Unknown property: $prop")
end

end
