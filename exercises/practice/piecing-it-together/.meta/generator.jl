module PiecingItTogether

const EXTRA_VOCABS = ["assocs"]

# Render a single { "key" value } entry for a Factor hashtable.
# aspectRatio must always be a Factor float literal so it compares
# equal to the float the solution computes.
function render_value(key, value)
    if key == "aspectRatio"
        return "{ \"$(key)\" $(repr(Float64(value))) }"
    elseif value isa AbstractString
        return "{ \"$(key)\" \"$(value)\" }"
    elseif value isa AbstractFloat
        return "{ \"$(key)\" $(repr(value)) }"
    elseif value isa Integer
        return "{ \"$(key)\" $(Int(value)) }"
    else
        error("unsupported value type for $(key): $(value)")
    end
end

function render_hashtable(dict)
    keys_order = ["pieces", "border", "inside", "rows", "columns", "aspectRatio", "format"]
    parts = String[]
    for k in keys_order
        if haskey(dict, k)
            push!(parts, render_value(k, dict[k]))
        end
    end
    return "H{ " * join(parts, " ") * " }"
end

function gen_test_case(case)
    input = render_hashtable(case["input"])
    expected = case["expected"]
    if expected isa Dict && haskey(expected, "error")
        msg = expected["error"]
        return """[ $(input) jigsaw-data ] [ "$(msg)" = ] must-fail-with"""
    else
        full = render_hashtable(expected)
        return "{ $(full) }\n[ $(input) jigsaw-data ] unit-test"
    end
end

end
