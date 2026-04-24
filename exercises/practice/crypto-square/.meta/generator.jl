module CryptoSquare

function gen_test_case(case)
    plaintext = escape_factor(case["input"]["plaintext"])
    expected = escape_factor(case["expected"])
    return """{ "$(expected)" }\n[ "$(plaintext)" ciphertext ] unit-test"""
end

end
