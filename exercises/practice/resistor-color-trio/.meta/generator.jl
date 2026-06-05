module ResistorColorTrio

function gen_test_case(case)
    colors = format_string_array(case["input"]["colors"])
    value = case["expected"]["value"]
    unit = case["expected"]["unit"]
    return "{ \"$(value) $(unit)\" }\n[ $(colors) label ] unit-test"
end

end
