module QueenAttack

function gen_test_case(case)
    property = case["property"]
    input = case["input"]

    if property == "create"
        pos = input["queen"]["position"]
        row = Int(pos["row"])
        column = Int(pos["column"])
        expected = case["expected"]
        if expected isa AbstractDict
            pred = occursin("row", expected["error"]) ?
                "row-not-on-board?" : "column-not-on-board?"
            return """[ $(row) $(column) <queen> ]\n[ $(pred) ] must-fail-with"""
        else
            return """[ $(row) $(column) <queen> drop ] must-not-fail"""
        end
    else
        white = input["white_queen"]["position"]
        black = input["black_queen"]["position"]
        wr = Int(white["row"])
        wc = Int(white["column"])
        br = Int(black["row"])
        bc = Int(black["column"])
        expected = case["expected"] ? "t" : "f"
        return """{ $(expected) } [ $(wr) $(wc) <queen> $(br) $(bc) <queen> can-attack? ] unit-test"""
    end
end

end
