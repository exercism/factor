module LineUp

function gen_test_case(case)
    name = case["input"]["name"]
    number = Int(case["input"]["number"])
    expected = case["expected"]
    return """{ "$(expected)" }\n[ "$(name)" $(number) format ] unit-test"""
end

end
