--Healer Bonanza
--I don't think they like you
--enemies
--70
--todo
function twitch_healer_bonanza()
    local rng = Random(1, 6)
    local healer = {
        scavenger = {
            "data/entities/animals/scavenger_heal.xml"
        },
        drone = {
            "data/entities/animals/healerdrone_physics.xml"
        }
    }
    local selected = "scavenger"
    if rng == 6 then
        selected = "drone"
    end

    for _, entity in pairs(healer[selected]) do
        local amount = Random(1, 3)
        for i = 1, amount do
            spawn_something(entity, Random(60, 90), Random(150, 190), true, false, append_viewer_name)
        end
    end
end
