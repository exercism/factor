module RelativeDistance

function gen_test_case(case)
    tree = case["input"]["familyTree"]
    a = case["input"]["personA"]
    b = case["input"]["personB"]
    expected = case["expected"]

    ks = sort(collect(keys(tree)))
    pairs = String[]
    for k in ks
        kids = join(["\"$(c)\"" for c in tree[k]], " ")
        push!(pairs, "        { \"$(k)\" { $(kids) } }")
    end
    treestr = "    H{\n" * join(pairs, "\n") * "\n    }"
    exp = expected === nothing ? "f" : string(Int(expected))
    body = "$(treestr)\n    \"$(a)\" \"$(b)\" degree-of-separation"
    return "{ $(exp) }\n[\n$(body)\n] unit-test"
end

end
