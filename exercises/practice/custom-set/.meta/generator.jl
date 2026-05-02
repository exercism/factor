module CustomSet

const EXTRA_VOCABS = ["sequences", "sets", "sorting"]

bool_factor(b) = b ? "t" : "f"

set_factor(arr) = isempty(arr) ? "<custom-set>" : "$(format_int_array(arr)) >custom-set"

function gen_test_case(case)
    prop = case["property"]
    inp = case["input"]
    exp = case["expected"]

    if prop == "empty"
        return "{ $(bool_factor(exp)) }\n[ $(set_factor(inp["set"])) null? ]\nunit-test"
    elseif prop == "contains"
        return "{ $(bool_factor(exp)) }\n[ $(to_int_str(inp["element"])) $(set_factor(inp["set"])) in? ]\nunit-test"
    elseif prop == "subset"
        return "{ $(bool_factor(exp)) }\n[ $(set_factor(inp["set1"])) $(set_factor(inp["set2"])) subset? ]\nunit-test"
    elseif prop == "disjoint"
        return "{ $(bool_factor(exp)) }\n[ $(set_factor(inp["set1"])) $(set_factor(inp["set2"])) intersects? not ]\nunit-test"
    elseif prop == "equal"
        return "{ $(bool_factor(exp)) }\n[ $(set_factor(inp["set1"])) $(set_factor(inp["set2"])) set= ]\nunit-test"
    elseif prop == "add"
        sorted = format_int_array(sort(collect(exp)))
        return "{ $(sorted) }\n[ $(set_factor(inp["set"])) dup $(to_int_str(inp["element"])) swap adjoin members natural-sort ]\nunit-test"
    end

    word = prop == "intersection" ? "intersect" :
           prop == "union" ? "union" :
           prop == "difference" ? "diff" :
           error("Unknown property: $prop")
    sorted = format_int_array(sort(collect(exp)))
    "{ $(sorted) }\n[ $(set_factor(inp["set1"])) $(set_factor(inp["set2"])) $(word) members natural-sort ]\nunit-test"
end

end
