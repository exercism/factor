module Accumulate

const HEADER = "USING: accumulate math unicode tools.test ;\nEXCLUDE: sequences => accumulate ;"

const ACCUMULATORS = Dict(
    "(x) => x * x" => "[ dup * ]",
    "(x) => upcase(x)" => "[ >upper ]",
    "(x) => reverse(x)" => "[ reverse ]",
    """(x) => accumulate(["1", "2", "3"], (y) => x + y)""" => """[ [ swap append ] curry { "1" "2" "3" } swap accumulate ]""",
)

function format_value(val)
    if val isa AbstractVector
        if isempty(val)
            return "{ }"
        elseif val[1] isa AbstractVector
            parts = map(format_value, val)
            return "{ $(join(parts, " ")) }"
        elseif val[1] isa AbstractString
            return format_string_array(val)
        else
            return format_int_array(val)
        end
    else
        return to_int_str(val)
    end
end

function format_input_list(list)
    if isempty(list)
        return "{ }"
    elseif list[1] isa AbstractString
        return format_string_array(list)
    else
        return format_int_array(list)
    end
end

function gen_test_case(case)
    list = format_input_list(case["input"]["list"])
    acc = ACCUMULATORS[case["input"]["accumulator"]]
    expected = format_value(case["expected"])
    return "{ $(expected) } [ $(list) $(acc) accumulate ] unit-test"
end

end
