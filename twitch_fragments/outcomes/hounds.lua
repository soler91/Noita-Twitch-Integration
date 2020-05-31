--Hounds
--Smithers release the hounds
--enemies
--200
--todo
function twitch_hounds()
    local rng = Random(1, 2)
    local hounds = {
        strong = {
            "data/entities/animals/zombie.xml"
        },
        weak = {
            "data/entities/animals/zombie_weak.xml"
        }
    }
    local selected = "weak"
    if rng == 2 then
        selected = "strong"
    end

    for _, entity in pairs(hounds[selected]) do
        local amount = Random(2, 7)
        for i = 1, amount do
            spawn_something(entity, Random(60, 90), Random(150, 190), true, false, append_viewer_name)
        end
    end
end
