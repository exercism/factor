module Grep

# The three fixture files (iliad.txt, midsummer-night.txt, paradise-lost.txt)
# ship with the exercise and are present in the working directory when the
# tests run, so the test suite reads them by name — no setup required.

string_array(arr) = isempty(arr) ? "{ }" : format_string_array(arr)

function gen_test_case(case)
    inp = case["input"]
    pattern = "\"$(escape_factor(inp["pattern"]))\""
    flags = string_array(inp["flags"])
    files = string_array(inp["files"])
    # `grep` returns one array, so the expected datastack is that single value.
    expected = string_array(case["expected"])
    "{ $(expected) }\n[ $(pattern) $(flags) $(files) grep ]\nunit-test"
end

end
