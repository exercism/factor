module PythagoreanTriplet

function format_triplets(triplets)
    parts = map(t -> "{ $(join(map(x -> string(Int(x)), t), " ")) }", triplets)
    return "{ $(join(parts, " ")) }"
end

function gen_test_case(case)
    n = Int(case["input"]["n"])
    expected = format_triplets(case["expected"])
    return "{ $(expected) }\n[ $(n) triplets-with-sum ] unit-test"
end

end
