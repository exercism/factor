module WordSearch

const EXTRA_VOCABS = ["sequences"]

fmt_point(p) = "{ $(to_int_str(p["column"])) $(to_int_str(p["row"])) }"

# Render an array of strings with one element per line, indented by `indent`.
function format_string_lines(arr, indent)
    pad = " "^indent
    inner = pad * "    "
    body = join(map(s -> "$(inner)\"$(escape_factor(s))\"", arr), "\n")
    return "$(pad){\n$(body)\n$(pad)}"
end

function gen_test_case(case)
    grid = case["input"]["grid"]
    words = case["input"]["wordsToSearchFor"]
    grid_lit = format_string_lines(grid, 4)
    words_lit = format_string_lines(words, 4)
    expected = case["expected"]
    pairs = map(words) do w
        loc = expected[w]
        if loc === nothing
            "{ \"$(escape_factor(w))\" f }"
        else
            "{ \"$(escape_factor(w))\" { $(fmt_point(loc["start"])) $(fmt_point(loc["end"])) } }"
        end
    end
    expected_lit = "H{ " * join(pairs, " ") * " }"
    return "{ $(expected_lit) }\n[\n$(grid_lit)\n$(words_lit)\n    search\n] unit-test"
end

end
