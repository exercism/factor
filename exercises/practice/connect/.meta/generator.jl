module Connect

function gen_test_case(case)
    expected = case["expected"]
    board = case["input"]["board"]
    if isempty(board)
        board_str = "{ }"
    else
        lines = map(s -> "    \"$(escape_factor(s))\"", board)
        board_str = "{\n" * join(lines, "\n") * "\n}"
    end
    return """{ "$(expected)" }\n[ $(board_str) winner ] unit-test"""
end

end
