module Yacht

function format_dice(dice)
    return "{ $(join(map(d -> string(Int(d)), dice), " ")) }"
end

function gen_test_case(case)
    dice = format_dice(case["input"]["dice"])
    category = case["input"]["category"]
    expected = Int(case["expected"])
    return """{ $(expected) } [ $(dice) "$(category)" score ] unit-test"""
end

end
