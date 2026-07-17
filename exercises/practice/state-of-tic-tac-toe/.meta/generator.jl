module StateOfTicTacToe

function gen_test_case(case)
    lines = map(s -> "    \"$(escape_factor(s))\"", case["input"]["board"])
    board = "{\n" * join(lines, "\n") * "\n}"
    expected = case["expected"]
    if expected isa Dict
        msg = escape_factor(expected["error"])
        return """[ $(board) gamestate ]\n[ "$(msg)" = ] must-fail-with"""
    else
        return """{ "$(expected)" }\n[ $(board) gamestate ] unit-test"""
    end
end

end
