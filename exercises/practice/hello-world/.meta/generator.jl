module HelloWorld

function gen_test_case(case)
    expected = case["expected"]
    return """{ "$(expected)" } [ say-hello ] unit-test"""
end

end
