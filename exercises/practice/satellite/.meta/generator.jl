module Satellite

function format_tree(node)
    if isempty(node)
        return "f"
    end
    v = escape_factor(node["v"])
    l = format_tree(node["l"])
    r = format_tree(node["r"])
    return """T{ tree { value "$(v)" } { left $(l) } { right $(r) } }"""
end

function gen_test_case(case)
    preorder = format_string_array(case["input"]["preorder"])
    inorder = format_string_array(case["input"]["inorder"])
    expected = case["expected"]
    if expected isa AbstractDict && haskey(expected, "error")
        return """[ $(preorder) $(inorder) tree-from-traversals ] [ invalid-traversals? ] must-fail-with"""
    end
    expected_str = format_tree(expected)
    return "{ $(expected_str) }\n[ $(preorder) $(inorder) tree-from-traversals ] unit-test"
end

end
