module SpaceAge

const PLANETS = Dict(
    "Earth" => "on-earth",
    "Mercury" => "on-mercury",
    "Venus" => "on-venus",
    "Mars" => "on-mars",
    "Jupiter" => "on-jupiter",
    "Saturn" => "on-saturn",
    "Uranus" => "on-uranus",
    "Neptune" => "on-neptune",
)

function gen_test_case(case)
    planet = case["input"]["planet"]
    seconds = case["input"]["seconds"]
    expected = case["expected"]
    word = PLANETS[planet]
    return "{ $(expected)  0.005 } [ $(seconds) $(word) ] unit-test~"
end

end
