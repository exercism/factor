module FlowerField

# Format an array of row strings as a single-level Factor array. Rows of
# 0 or 1 elements stay inline; larger grids put one row per line, indented
# four spaces, with the closing brace at column 0.
function format_grid(rows)
    isempty(rows) && return "{ }"
    length(rows) == 1 && return "{ \"$(escape_factor(rows[1]))\" }"
    body = join(map(s -> "    \"$(escape_factor(s))\"", rows), "\n")
    return "{\n$(body)\n}"
end

function gen_test_case(case)
    garden = case["input"]["garden"]
    expected = case["expected"]
    # The expected grid is the input grid with some spaces replaced by
    # digits, so lay both out at the same indentation to make that obvious.
    # Collapsing the outer `{ ... }` onto the inner array's lines (`{ {`
    # ... `} }`) keeps the expected rows at the same column as the input.
    exp = "{ $(format_grid(expected)) }"
    inp = format_grid(garden)
    return "$(exp)\n[ $(inp) annotate ] unit-test"
end

end
