module TwelveDays

function gen_test_case(case)
    input = case["input"]
    start, finish = input["startVerse"], input["endVerse"]
    lines = format_string_array(case["expected"])
    return "{ $(lines) }\n[ $(start) $(finish) recite ] unit-test"
end

end
