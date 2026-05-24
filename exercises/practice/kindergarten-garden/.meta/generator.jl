module KindergartenGarden

function gen_test_case(case)
    diagram = escape_factor(case["input"]["diagram"])
    student = case["input"]["student"]
    plants = join(map(p -> "\"$(p)\"", case["expected"]), " ")
    return """{ { $(plants) } }\n[ "$(diagram)" "$(student)" plants ] unit-test"""
end

end
