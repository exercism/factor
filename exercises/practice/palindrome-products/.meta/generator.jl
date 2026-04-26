module PalindromeProducts

function format_factors(factors)
    pairs = map(f -> "{ $(to_int_str(f[1])) $(to_int_str(f[2])) }", factors)
    return "{ $(join(pairs, " ")) }"
end

function gen_test_case(case)
    mn = to_int_str(case["input"]["min"])
    mx = to_int_str(case["input"]["max"])
    prop = case["property"]
    expected = case["expected"]
    if expected isa Dict && haskey(expected, "error")
        msg = expected["error"]
        return """[ $(mn) $(mx) $(prop) ]\n[ "$(msg)" = ] must-fail-with"""
    else
        val = expected["value"]
        factors = expected["factors"]
        val_str = isnothing(val) ? "f" : to_int_str(val)
        fac_str = format_factors(factors)
        return "{ $(val_str) $(fac_str) }\n[ $(mn) $(mx) $(prop) ] unit-test"
    end
end

end
