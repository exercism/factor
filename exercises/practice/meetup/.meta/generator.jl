module Meetup

const EXTRA_VOCABS = ["calendar"]

function gen_test_case(case)
    i = case["input"]
    year, month = i["year"], i["month"]
    week, dayofweek = i["week"], i["dayofweek"]
    ey, em, ed = parse.(Int, split(case["expected"], "-"))
    return """{ t } [ $(year) $(month) "$(week)" "$(dayofweek)" meetup  $(ey) $(em) $(ed) <date> = ] unit-test"""
end

end
