module GameOfLife

function encode_row(row)
    isempty(row) && return "0x0"
    bits = join(map(x -> string(Int(x)), row), "")
    return "0x" * string(parse(BigInt, bits, base=2), base=16)
end

function format_matrix(matrix)
    parts = map(encode_row, matrix)
    return "{ $(join(parts, " ")) }"
end

function gen_test_case(case)
    matrix = case["input"]["matrix"]
    expected = case["expected"]
    if isempty(matrix)
        return "{ { } } [ { } 0 tick ] unit-test"
    end
    cols = isempty(matrix[1]) ? 0 : length(matrix[1])
    inp = format_matrix(matrix)
    exp = format_matrix(expected)
    return "{ $(exp) }\n[ $(inp) $(cols) tick ] unit-test"
end

end
