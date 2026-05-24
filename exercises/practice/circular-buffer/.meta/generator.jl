module CircularBuffer

const EXTRA_VOCABS = ["arrays", "locals", "sequences"]
const EXTRA_HEADER = "FROM: circular-buffer => read write ;"

function fmt_op(op)
    operation = op["operation"]
    if operation == "write"
        return "$(op["item"]) buf write"
    elseif operation == "overwrite"
        return "$(op["item"]) buf overwrite"
    elseif operation == "clear"
        return "buf clear-buffer"
    elseif operation == "read"
        if get(op, "should_succeed", true)
            return "buf read log push"
        else
            return "buf read drop"
        end
    else
        error("unknown operation: " * operation)
    end
end

function gen_test_case(case)
    cap = case["input"]["capacity"]
    ops = case["input"]["operations"]

    last_op = ops[end]
    has_failure = !get(last_op, "should_succeed", true)

    body = join(map(fmt_op, ops), "\n      ")
    setup = "$(cap) <circular-buffer> :> buf\n      V{ } clone :> log"

    if has_failure
        return """[
    [let $(setup)
      $(body)
    ]
] must-fail"""
    else
        reads = [op["expected"] for op in ops
                 if op["operation"] == "read" && get(op, "should_succeed", true)]
        expected = "{ " * join(map(string, reads), " ") * " }"
        return """{ $(expected) } [
    [let $(setup)
      $(body)
      log >array
    ]
] unit-test"""
    end
end

end
