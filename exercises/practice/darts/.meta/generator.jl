module Darts

function format_float(x)
    if x == floor(x)
        return string(Int(x)) * ".0"
    else
        return string(Float64(x))
    end
end

function gen_test_case(case)
    x = format_float(case["input"]["x"])
    y = format_float(case["input"]["y"])
    expected = case["expected"]
    return "{ $(expected) } [ $(x) $(y) score ] unit-test"
end

end
