module ListOps

const WORD_NAMES = Dict(
    "append" => "list-append",
    "concat" => "list-concat",
    "filter" => "select",
    "length" => "list-length",
    "map" => "collect",
    "foldl" => "foldl",
    "foldr" => "foldr",
    "reverse" => "list-reverse",
)

const FUNCTIONS = Dict(
    "(x) -> x modulo 2 == 1" => "[ odd? ]",
    "(x) -> x + 1" => "[ 1 + ]",
    "(acc, el) -> el * acc" => "[ * ]",
    "(acc, el) -> el + acc" => "[ + ]",
    "(acc, el) -> el / acc" => "[ swap / ]",
)

function gen_test_case(case)
    prop = case["property"]
    word = WORD_NAMES[prop]
    expected = case["expected"]

    if prop == "append"
        l1 = format_nested_array(case["input"]["list1"])
        l2 = format_nested_array(case["input"]["list2"])
        return "{ $(format_nested_array(expected)) }\n[ $(l1) $(l2) $(word) ] unit-test"

    elseif prop == "concat"
        lists = format_nested_array(case["input"]["lists"])
        return "{ $(format_nested_array(expected)) }\n[ $(lists) $(word) ] unit-test"

    elseif prop in ("filter", "map")
        list = format_int_array(case["input"]["list"])
        func = FUNCTIONS[case["input"]["function"]]
        return "{ $(format_int_array(expected)) }\n[ $(list) $(func) $(word) ] unit-test"

    elseif prop in ("foldl", "foldr")
        list = format_int_array(case["input"]["list"])
        func = FUNCTIONS[case["input"]["function"]]
        return "{ $(to_int_str(expected)) }\n[ $(list) $(to_int_str(case["input"]["initial"])) $(func) $(word) ] unit-test"

    elseif prop == "length"
        list = format_int_array(case["input"]["list"])
        return "{ $(Int(expected)) }\n[ $(list) $(word) ] unit-test"

    elseif prop == "reverse"
        list = format_nested_array(case["input"]["list"])
        return "{ $(format_nested_array(expected)) }\n[ $(list) $(word) ] unit-test"
    end
end

end
