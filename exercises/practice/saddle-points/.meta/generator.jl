module SaddlePoints

# Format a matrix (array of int rows) as a Factor array literal. A matrix with
# more than one row is laid out one row per line, indented four spaces, with the
# closing brace at column 0. A single row stays inline.
function format_grid(matrix)
    isempty(matrix) && return "{ }"
    length(matrix) == 1 && return "{ $(format_int_array(matrix[1])) }"
    body = join(map(r -> "    $(format_int_array(r))", matrix), "\n")
    return "{\n$(body)\n}"
end

# Format the expected list of saddle points as `{ { r c } { r c } ... }`,
# ordered row-major (row ascending, then column ascending) to match the word.
function format_points(points)
    isempty(points) && return "{ }"
    sorted = sort(points; by = p -> (Int(p["row"]), Int(p["column"])))
    parts = map(p -> "{ $(to_int_str(p["row"])) $(to_int_str(p["column"])) }", sorted)
    return "{ $(join(parts, " ")) }"
end

function gen_test_case(case)
    matrix = case["input"]["matrix"]
    # `unit-test` takes the expected output stack as its first array, so wrap the
    # single points array (the word's one return value) in an extra `{ }`.
    expected = "{ $(format_points(case["expected"])) }"
    grid = format_grid(matrix)
    return "$(expected)\n[ $(grid) saddle-points ] unit-test"
end

end
