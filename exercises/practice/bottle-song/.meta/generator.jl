module BottleSong

function gen_test_case(case)
    input = case["input"]
    start, take = input["startBottles"], input["takeDown"]
    lines = format_string_array(case["expected"])
    return "{ $(lines) }\n[ $(start) $(take) recite ] unit-test"
end

end
