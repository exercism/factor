module RnaTranscription

function gen_test_case(case)
    dna = case["input"]["dna"]
    expected = case["expected"]
    return """{ "$(expected)" }\n[ "$(dna)" to-rna ] unit-test"""
end

end
