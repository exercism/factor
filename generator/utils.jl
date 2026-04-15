# Shared utilities for exercise generators

"""Escape a string for use in a Factor string literal."""
function escape_factor(s::AbstractString)
    s = replace(s, "\\" => "\\\\")
    s = replace(s, "\"" => "\\\"")
    s = replace(s, "\t" => "\\t")
    s = replace(s, "\n" => "\\n")
    s = replace(s, "\r" => "\\r")
    return s
end

"""Convert a number to an integer string, handling Float64 precision loss."""
function to_int_str(n)
    n isa AbstractFloat ? string(BigInt(round(n))) : string(Int(n))
end

"""Format an array of integers as a Factor array literal `{ 1 2 3 }`."""
function format_int_array(arr)
    return "{ $(join(map(to_int_str, arr), " ")) }"
end

"""Format an array of integers as a Factor vector literal `V{ 1 2 3 }`."""
function format_int_vector(arr)
    return "V{ $(join(map(to_int_str, arr), " ")) }"
end

"""Format an array of strings as a Factor array literal `{ "a" "b" }`."""
function format_string_array(arr)
    parts = map(s -> "\"$(escape_factor(s))\"", arr)
    return "{ $(join(parts, " ")) }"
end

"""Format an array of strings as a Factor vector literal `V{ "a" "b" }`."""
function format_string_vector(arr)
    parts = map(s -> "\"$(escape_factor(s))\"", arr)
    return "V{ $(join(parts, " ")) }"
end

"""Format a nested array (array of arrays of ints) as a Factor literal."""
function format_nested_array(arr)
    parts = map(arr) do x
        x isa AbstractVector ? format_nested_array(x) : to_int_str(x)
    end
    return "{ $(join(parts, " ")) }"
end
