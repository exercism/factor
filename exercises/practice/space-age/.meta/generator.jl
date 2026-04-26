module SpaceAge

function gen_test_case(case)
    planet = lowercase(case["input"]["planet"])
    seconds = case["input"]["seconds"]
    expected = case["expected"]
    return "{ $(expected) 0.005 } [ $(seconds) $(planet) on-planet ] unit-test~"
end

end
