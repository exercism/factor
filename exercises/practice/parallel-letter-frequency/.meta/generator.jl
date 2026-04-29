module ParallelLetterFrequency

function escape_factor(s)
    replace(s, "\\" => "\\\\", "\"" => "\\\"")
end

function gen_test_case(case)
    texts = case["input"]["texts"]
    expected = case["expected"]

    if isempty(texts)
        texts_str = "{ }"
    else
        quoted = ["\"$(escape_factor(t))\"" for t in texts]
        texts_str = "{\n        " * join(quoted, "\n        ") * "\n    }"
    end

    if isempty(expected)
        expected_str = "H{ }"
    else
        pairs = ["{ CHAR: $(k) $(v) }" for (k, v) in expected]
        expected_str = "H{\n        " * join(pairs, "\n        ") * "\n    }"
    end

    return """{ $(expected_str) }\n[\n    $(texts_str) calculate-frequencies\n] unit-test"""
end

end
