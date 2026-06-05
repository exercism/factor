module ProteinTranslation

function gen_test_case(case)
    strand = case["input"]["strand"]
    expected = case["expected"]
    if expected isa AbstractDict && haskey(expected, "error")
        return """[ "$(strand)" proteins ] [ invalid-codon? ] must-fail-with"""
    end
    expected_str = isempty(expected) ? "{ }" : format_string_array(expected)
    return "{ $(expected_str) }\n[ \"$(strand)\" proteins ] unit-test"
end

end
