module BinarySearchTree

function format_tree(t)
    if t === nothing
        return "T{ leaf }"
    end
    data = t["data"]
    left = format_tree(t["left"])
    right = format_tree(t["right"])
    return "T{ branch f \"$(data)\" $(left) $(right) }"
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
