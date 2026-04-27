module Knapsack

function gen_test_case(case)
    max_weight = to_int_str(case["input"]["maximumWeight"])
    items = case["input"]["items"]
    item_strs = ["T{ item { weight $(to_int_str(it["weight"])) } { value $(to_int_str(it["value"])) } }" for it in items]
    items_str = "{ $(join(item_strs, " ")) }"
    expected = to_int_str(case["expected"])
    return "{ $(expected) }\n[ $(max_weight) $(items_str) maximum-value ] unit-test"
end

end
