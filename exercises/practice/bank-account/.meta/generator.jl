module BankAccount

const EXTRA_VOCABS = ["concurrency.combinators", "locals", "sequences"]

function fmt_op(op)
    operation = op["operation"]
    if operation == "open"
        return "a open-account"
    elseif operation == "close"
        return "a close-account"
    elseif operation == "deposit"
        return "$(op["amount"]) a deposit"
    elseif operation == "withdraw"
        return "$(op["amount"]) a withdraw"
    elseif operation == "balance"
        return "a balance"
    elseif operation == "concurrent"
        inner = join(map(fmt_op, op["operations"]), " ")
        return "$(op["number"]) <iota> [ drop $(inner) ] parallel-each"
    else
        error("unknown operation: " * operation)
    end
end

function gen_test_case(case)
    ops = case["input"]["operations"]
    expected = case["expected"]
    body = join(map(fmt_op, ops), "\n      ")
    if expected isa AbstractDict        # { "error": "..." } — the last op throws
        return """[
    [let <bank-account> :> a
      $(body)
    ]
] must-fail"""
    else                                # the final `balance` op leaves the number
        return """{ $(expected) } [
    [let <bank-account> :> a
      $(body)
    ]
] unit-test"""
    end
end

end
