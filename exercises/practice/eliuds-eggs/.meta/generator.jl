module EliudsEggs

function gen_test_case(case)
    number = Int(case["input"]["number"])
    expected = Int(case["expected"])
    return "{ $(expected) } [ $(number) egg-count ] unit-test"
end

end
