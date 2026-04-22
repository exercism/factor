module DifferenceOfSquares

const PROPERTIES = Dict(
    "squareOfSum" => "square-of-sum",
    "sumOfSquares" => "sum-of-squares",
    "differenceOfSquares" => "difference-of-squares",
)

function gen_test_case(case)
    n = Int(case["input"]["number"])
    prop = case["property"]
    word = PROPERTIES[prop]
    expected = if prop == "squareOfSum"
        (BigInt(n) * (n + 1) ÷ 2)^2
    elseif prop == "sumOfSquares"
        BigInt(n) * (n + 1) * (2n + 1) ÷ 6
    else
        (BigInt(n) * (n + 1) ÷ 2)^2 - BigInt(n) * (n + 1) * (2n + 1) ÷ 6
    end
    return "{ $(expected) } [ $(n) $(word) ] unit-test"
end

end
