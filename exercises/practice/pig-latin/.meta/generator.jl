module PigLatin

function gen_test_case(case)
    phrase = escape_factor(case["input"]["phrase"])
    expected = escape_factor(case["expected"])
    return "{ \"$(expected)\" } [ \"$(phrase)\" translate ] unit-test"
end

end
