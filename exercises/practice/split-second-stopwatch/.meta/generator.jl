module SplitSecondStopwatch

const EXTRA_VOCABS = ["locals"]

const MUTATION_WORDS = Dict(
    "start" => "start",
    "stop"  => "stop",
    "reset" => "reset",
    "lap"   => "lap",
)

const QUERY_WORDS = Dict(
    "state"        => "state",
    "currentLap"   => "current-lap",
    "total"        => "total",
    "previousLaps" => "previous-laps",
)

function format_expected(val)
    if val isa AbstractString
        return "\"$(escape_factor(val))\""
    elseif val isa AbstractVector
        return isempty(val) ? "{ }" : format_string_array(val)
    else
        error("unexpected `expected` value: $val")
    end
end

function is_error_case(commands)
    for c in commands
        e = get(c, "expected", nothing)
        e isa AbstractDict && haskey(e, "error") && return true
    end
    return false
end

function gen_test_case(case)
    commands = case["input"]["commands"]
    body = String[]
    expecteds = String[]
    for c in commands
        name = c["command"]
        if name == "new"
            push!(body, "<stopwatch> :> sw")
        elseif name == "advanceTime"
            push!(body, "\"$(c["by"])\" sw advance-time")
        elseif haskey(MUTATION_WORDS, name)
            push!(body, "sw $(MUTATION_WORDS[name])")
        elseif haskey(QUERY_WORDS, name)
            push!(body, "sw $(QUERY_WORDS[name])")
            push!(expecteds, format_expected(c["expected"]))
        else
            error("unknown command: $name")
        end
    end
    body_str = join(body, "\n      ")
    if is_error_case(commands)
        return """[
    [let $(body_str)
    ]
] must-fail"""
    else
        return """{ $(join(expecteds, " ")) } [
    [let $(body_str)
    ]
] unit-test"""
    end
end

end
