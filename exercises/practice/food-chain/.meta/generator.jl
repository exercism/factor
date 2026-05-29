module FoodChain

function factor_string(s)
    escaped = replace(replace(s, "\\" => "\\\\"), "\"" => "\\\"")
    return "\"$(escaped)\""
end

function gen_test_case(case)
    i = case["input"]
    start, finish = i["startVerse"], i["endVerse"]
    lines = join((factor_string(l) for l in case["expected"]), " ")
    return """{ { $(lines) } }\n[ $(start) $(finish) food-chain ] unit-test"""
end

end
