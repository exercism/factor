module FlowerField

function gen_test_case(case)
    garden = case["input"]["garden"]
    expected = case["expected"]
    inp = format_string_array(garden)
    exp = format_string_array(expected)
    return "{ $(exp) }\n[ $(inp) annotate ] unit-test"
end

end
