module HelloWorld

const HEADER = "USING: hello-world tools.test ;"

function gen_test_case(case)
    expected = case["expected"]
    return """{ "$(expected)" } [ hello ] unit-test"""
end

end
