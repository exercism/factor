module ResistorColor

const HEADER = "USING: resistor-color tools.test ;"

function gen_test_case(case)
    prop = case["property"]
    if prop == "colorCode"
        color = case["input"]["color"]
        expected = Int(case["expected"])
        return """{ $(expected) } [ "$(color)" color-code ] unit-test"""
    else
        expected = format_string_array(case["expected"])
        return "{ $(expected) } [ colors ] unit-test"
    end
end

end
