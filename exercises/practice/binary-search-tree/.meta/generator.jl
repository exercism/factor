module BinarySearchTree

function format_tree(t, indent="")
    if t === nothing
        return "T{ leaf }"
    end
    data = t["data"]
    l = t["left"]
    r = t["right"]
    # Keep branches whose children are both leaves on a single line; break
    # larger branches so each child sits on its own indented line.
    if l === nothing && r === nothing
        return "T{ branch f \"$(data)\" T{ leaf } T{ leaf } }"
    end
    child = indent * "    "
    left = format_tree(l, child)
    right = format_tree(r, child)
    return string(
        "T{ branch f \"$(data)\"\n",
        child, left, "\n",
        child, right, " }",
    )
end

function format_strings(arr)
    if isempty(arr)
        return "{ }"
    end
    return "{ " * join(map(s -> "\"$(s)\"", arr), " ") * " }"
end

function gen_test_case(case)
    tree_data = format_strings(case["input"]["treeData"])
    prop = case["property"]
    if prop == "data"
        expected = format_tree(case["expected"])
        return """{ $(expected) }\n[ $(tree_data) <bst> ] unit-test"""
    elseif prop == "sortedData"
        expected = format_strings(case["expected"])
        return """{ $(expected) }\n[ $(tree_data) <bst> sorted-data ] unit-test"""
    else
        error("unknown property: " * prop)
    end
end

end
