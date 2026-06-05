module KillerSudokuHelper

function gen_test_case(case)
    cage = case["input"]["cage"]
    sum = Int(cage["sum"])
    size = Int(cage["size"])
    exclude = format_int_array(cage["exclude"])
    expected = format_nested_array(case["expected"])
    return "{ $(expected) } [ $(sum) $(size) $(exclude) combinations ] unit-test"
end

end
