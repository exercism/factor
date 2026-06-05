module ResistorColorDuo

function gen_test_case(case)
    colors = format_string_array(case["input"]["colors"])
    expected = Int(case["expected"])
    return "{ $(expected) }\n[ $(colors) value ] unit-test"
end

end
