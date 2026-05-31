module IntergalacticTransmission

const EXTRA_VOCABS = ["sequences"]

function fmt_array(arr)
    "{ " * join(["$(s)" for s in arr], " ") * (isempty(arr) ? "}" : " }")
end

function gen_test_case(case)
    property = case["property"]
    word = property == "transmitSequence" ? "transmit-sequence" : "decode-message"
    input = fmt_array(case["input"]["message"])
    expected = case["expected"]
    if expected isa Dict
        msg = expected["error"]
        return """[ $(input) $(word) ] [ "$(msg)" = ] must-fail-with"""
    else
        return "{ $(fmt_array(expected)) }\n[ $(input) $(word) ] unit-test"
    end
end

end
