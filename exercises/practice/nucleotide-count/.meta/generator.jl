module NucleotideCount

function gen_test_case(case)
    strand = escape_factor(case["input"]["strand"])
    expected = case["expected"]
    if expected isa AbstractDict && haskey(expected, "error")
        return """[ "$(strand)" nucleotide-counts ] [ invalid-nucleotide? ] must-fail-with"""
    end
    pairs = ["""{ "$(k)" $(to_int_str(v)) }""" for (k, v) in expected]
    expected_str = "H{ $(join(pairs, " ")) }"
    return """{ $(expected_str) }\n[ "$(strand)" nucleotide-counts ] unit-test"""
end

end
