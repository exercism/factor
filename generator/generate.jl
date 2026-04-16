#!/usr/bin/env julia
using JSON3, TOML

const GENERATOR_DIR = @__DIR__
const TRACK_DIR = dirname(GENERATOR_DIR)

function read_canonical_data(exercise)
    prefix = "Using cached 'problem-specifications' dir: "
    info = readchomp(Cmd(`$(joinpath(TRACK_DIR, "bin", "configlet")) info -o -v d`))
    lines = split(info, '\n')
    cache_lines = filter(l -> startswith(l, prefix), lines)
    length(cache_lines) == 1 || error("Could not determine 'problem-specifications' dir")
    cache_dir = cache_lines[1][length(prefix)+1:end]
    path = joinpath(cache_dir, "exercises", exercise, "canonical-data.json")
    return JSON3.read(read(path, String))
end

function flatten_cases(data)
    cases_by_id = OrderedDict{String,Any}()
    function traverse(node)
        if haskey(node, :cases)
            for child in node.cases
                traverse(child)
            end
        else
            add_case!(cases_by_id, node)
        end
    end
    traverse(data)
    return collect(values(cases_by_id))
end

function add_case!(cases_by_id, case)
    dict = to_dict(case)
    if haskey(case, :reimplements)
        cases_by_id[case.reimplements] = dict
    else
        cases_by_id[case.uuid] = dict
    end
end

function to_dict(obj)
    if obj isa JSON3.Object
        return Dict{String,Any}(string(k) => to_dict(v) for (k, v) in pairs(obj))
    elseif obj isa JSON3.Array
        return [to_dict(v) for v in obj]
    else
        return obj
    end
end

# Minimal ordered dict preserving insertion order
mutable struct OrderedDict{K,V}
    keys::Vector{K}
    dict::Dict{K,V}
    OrderedDict{K,V}() where {K,V} = new(K[], Dict{K,V}())
end
Base.haskey(d::OrderedDict, k) = haskey(d.dict, k)
function Base.setindex!(d::OrderedDict, v, k)
    if !haskey(d.dict, k)
        push!(d.keys, k)
    end
    d.dict[k] = v
end
Base.values(d::OrderedDict) = [d.dict[k] for k in d.keys]

function filter_by_toml(cases, exercise)
    toml_path = joinpath(TRACK_DIR, "exercises", "practice", exercise, ".meta", "tests.toml")
    isfile(toml_path) || return cases
    toml = TOML.parsefile(toml_path)
    return filter(cases) do case
        uuid = case["uuid"]
        entry = get(toml, uuid, nothing)
        entry === nothing && return true
        return get(entry, "include", true)
    end
end

function load_extra_cases(exercise)
    path = joinpath(TRACK_DIR, "exercises", "practice", exercise, ".meta", "supplements.json")
    isfile(path) || return Dict{String,Any}[]
    return [to_dict(c) for c in JSON3.read(read(path, String))]
end

const UTILS_PATH = joinpath(GENERATOR_DIR, "utils.jl")

function load_exercise_module(slug)
    path = joinpath(TRACK_DIR, "exercises", "practice", slug, ".meta", "generator.jl")
    isfile(path) || error("No generator module found: $path")
    code = read(path, String)
    # Inject utils include after the module declaration line
    code = replace(code, r"^(module \w+)"m =>
        SubstitutionString("\\1\ninclude(\"$(escape_string(UTILS_PATH))\")"))
    mod = include_string(Main, code, path)
    return mod
end

const STOP_HERE_DEF = ": STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing"

function render_test_file(mod, cases)
    header = mod.HEADER
    if length(cases) > 1
        header = replace(header, "tools.test" => "kernel tools.test lexer")
    else
        header = replace(header, "tools.test" => "kernel tools.test")
    end
    lines = String[header]
    if length(cases) > 1
        push!(lines, "")
        push!(lines, STOP_HERE_DEF)
    end
    push!(lines, "")
    for (i, case) in enumerate(cases)
        push!(lines, Base.invokelatest(mod.gen_test_case, case))
        if i == 1 && length(cases) > 1
            push!(lines, "")
            push!(lines, "STOP-HERE")
            push!(lines, "")
        end
    end
    push!(lines, "")
    return join(lines, "\n")
end

function generate(exercise)
    data = read_canonical_data(exercise)
    cases = flatten_cases(data)
    cases = filter_by_toml(cases, exercise)
    extra = load_extra_cases(exercise)
    append!(cases, extra)
    mod = load_exercise_module(exercise)
    content = render_test_file(mod, cases)
    test_path = joinpath(TRACK_DIR, "exercises", "practice", exercise, exercise, "$(exercise)-tests.factor")
    mkpath(dirname(test_path))
    write(test_path, content)
    println("Generated: $test_path")
end

function list_exercises()
    dir = joinpath(TRACK_DIR, "exercises", "practice")
    return sort(filter(d -> isdir(joinpath(dir, d)) && !startswith(d, "."), readdir(dir)))
end

function main()
    args = ARGS
    if isempty(args) || args[1] == "--all"
        for exercise in list_exercises()
            mod_path = joinpath(TRACK_DIR, "exercises", "practice", exercise, ".meta", "generator.jl")
            if isfile(mod_path)
                try
                    generate(exercise)
                catch e
                    @warn "Failed to generate $exercise" exception=e
                end
            else
                @info "No generator module for $exercise, skipping"
            end
        end
    else
        for exercise in args
            generate(exercise)
        end
    end
end

main()
