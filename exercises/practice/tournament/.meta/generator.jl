module Tournament

function gen_test_case(case)
    rows = join(map(r -> "\"$(escape_factor(r))\"", case["input"]["rows"]), " ")
    expected = join(map(l -> "\"$(escape_factor(l))\"", case["expected"]), " ")
    if isempty(case["input"]["rows"])
        rows_str = "{ }"
    else
        rows_str = "{ $(rows) }"
    end
    if isempty(case["expected"])
        expected_str = "{ }"
    else
        expected_str = "{ $(expected) }"
    end
    return """{ $(expected_str) }\n[ $(rows_str) tally ] unit-test"""
end

end
