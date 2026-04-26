module FlattenArray

function format_nullable_nested(arr)
    parts = map(arr) do x
        if x === nothing
            "f"
        elseif x isa AbstractVector
            format_nullable_nested(x)
        else
            to_int_str(x)
        end
    end
    return "{ $(join(parts, " ")) }"
end

function gen_test_case(case)
    input = format_nullable_nested(case["input"]["array"])
    expected = format_nullable_nested(case["expected"])
    return "{ $(expected) }\n[ $(input) flatten ] unit-test"
end

end
