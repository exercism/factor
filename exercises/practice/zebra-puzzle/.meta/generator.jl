module ZebraPuzzle

function gen_test_case(case)
    word = if case["property"] == "drinksWater"
        "drinks-water"
    elseif case["property"] == "ownsZebra"
        "owns-zebra"
    else
        error("unknown property: " * case["property"])
    end
    return """{ $(case["expected"]) } [ $(word) ] unit-test"""
end

end
