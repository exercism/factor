module Alphametics

const EXTRA_VOCABS = ["hashtables"]

function gen_test_case(case)
    puzzle = replace(replace(case["input"]["puzzle"], "\\" => "\\\\"), "\"" => "\\\"")
    expected = case["expected"]
    if expected === nothing
        return """{ f } [ "$(puzzle)" solve ] unit-test"""
    else
        pairs = join(("{ CHAR: $(k) $(v) }" for (k, v) in expected), " ")
        return """{ H{ $(pairs) } } [ "$(puzzle)" solve ] unit-test"""
    end
end

end
