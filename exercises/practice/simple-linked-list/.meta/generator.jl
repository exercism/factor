module SimpleLinkedList

const EXTRA_VOCABS = ["accessors", "arrays", "make", "math", "sequences"]

function init_factor(initial)
    isempty(initial) ? "<linked-list>" : "$(format_int_array(initial)) >linked-list"
end

# Returns (factor_code, records_value)
function op_factor(op)
    name = op["operation"]
    if name == "push"
        return ("$(to_int_str(op["value"])) list-push", false)
    elseif name == "pop"
        return ("list-pop ,", true)
    elseif name == "peek"
        return ("dup list-peek ,", true)
    elseif name == "count"
        return ("dup length ,", true)
    elseif name == "toList"
        return ("dup linked-list>array ,", true)
    elseif name == "reverse"
        return ("list-reverse", false)
    end
    error("Unknown operation: $name")
end

function gen_test_case(case)
    initial = get(case["input"], "initialValues", [])
    ops = case["input"]["operations"]

    error_idx = findfirst(
        op -> haskey(op, "expected") && op["expected"] isa AbstractDict && haskey(op["expected"], "error"),
        ops,
    )

    if error_idx !== nothing
        @assert error_idx == 1 "expected error op to be the first op"
        op = ops[1]
        op_word = op["operation"] == "pop" ? "list-pop" :
                  op["operation"] == "peek" ? "list-peek" :
                  error("unsupported error op: $(op["operation"])")
        return "[ $(init_factor(initial)) $(op_word) ] [ list-empty? ] must-fail-with"
    end

    expected_values = String[]
    code = String[init_factor(initial)]
    for op in ops
        (factor, records) = op_factor(op)
        push!(code, factor)
        if records
            exp = op["expected"]
            push!(expected_values, exp isa AbstractVector ? format_int_array(exp) : to_int_str(exp))
        end
    end
    push!(code, "drop")

    expected = "{ $(join(expected_values, " ")) }"
    "{ $expected }\n[ [ $(join(code, " ")) ] { } make ]\nunit-test"
end

end
