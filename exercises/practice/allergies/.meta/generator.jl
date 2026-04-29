module Allergies

function gen_test_case(case)
    property = case["property"]
    input = case["input"]
    expected = case["expected"]

    if property == "allergicTo"
        score = input["score"]
        item = input["item"]
        bool_str = expected ? "t" : "f"
        return """{ $(bool_str) }\n[ $(score) "$(item)" allergic-to ] unit-test"""
    elseif property == "list"
        score = input["score"]
        if isempty(expected)
            items_str = "HS{ }"
        else
            quoted = ["\"$(s)\"" for s in expected]
            items_str = "HS{ " * join(quoted, " ") * " }"
        end
        return """{ $(items_str) }\n[ $(score) allergens ] unit-test"""
    end
end

end
