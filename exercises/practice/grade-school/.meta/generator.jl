module GradeSchool

const EXTRA_VOCABS = ["locals", "sequences"]
const EXTRA_HEADER = """:: add-results ( students -- bools )
    <school> :> s students [ first2 [ s ] 2dip add-student ] map ;
:: add-all ( students -- school )
    <school> :> s students [ first2 [ s ] 2dip add-student drop ] each s ;"""

# Render a list of [name, grade] pairs as a Factor literal:
#   { { "Aimee" 2 } { "Blair" 2 } }   (empty -> { })
function students_literal(students)
    isempty(students) && return "{ }"
    pairs = ["{ \"$(s[1])\" $(s[2]) }" for s in students]
    return "{ " * join(pairs, " ") * " }"
end

# Render a list of strings as a Factor literal: { "Anna" "Barb" }  (empty -> { })
function names_literal(names)
    isempty(names) && return "{ }"
    return "{ " * join(["\"$(n)\"" for n in names], " ") * " }"
end

# Render a list of booleans as a Factor literal: { t t f }  (empty -> { })
function bools_literal(bools)
    isempty(bools) && return "{ }"
    return "{ " * join([b ? "t" : "f" for b in bools], " ") * " }"
end

function gen_test_case(case)
    property = case["property"]
    students = students_literal(case["input"]["students"])

    if property == "add"
        expected = bools_literal(case["expected"])
        return "{ $(expected) } [ $(students) add-results ] unit-test"
    elseif property == "roster"
        expected = names_literal(case["expected"])
        return "{ $(expected) } [ $(students) add-all roster ] unit-test"
    elseif property == "grade"
        expected = names_literal(case["expected"])
        desired = case["input"]["desiredGrade"]
        return "{ $(expected) } [ $(students) add-all $(desired) grade ] unit-test"
    else
        error("unknown property: " * property)
    end
end

end
