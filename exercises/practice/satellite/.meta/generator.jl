module Satellite

function format_tree(node, indent="")
    if isempty(node)
        return "f"
    end
    v = escape_factor(node["v"])
    l = node["l"]
    r = node["r"]
    # Keep leaves on a single line; break internal nodes so each child
    # sits on its own indented line (mirroring the reference layouts).
    if isempty(l) && isempty(r)
        return """T{ tree { value "$(v)" } { left f } { right f } }"""
    end
    child = indent * "    "
    ls = format_tree(l, child)
    rs = format_tree(r, child)
    return string(
        "T{ tree { value \"$(v)\" }\n",
        child, "{ left ", ls, " }\n",
        child, "{ right ", rs, " } }",
    )
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
