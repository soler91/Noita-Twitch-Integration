--The Swarm
--Where's the bug spray?!?
--enemies
--160
--todo
function twitch_the_swarm()
    local animal = {
        pikku = {
            "data/entities/animals/firebug.xml"
        }
    }
    local selected = "pikku"

    for _, entity in pairs(animal[selected]) do
        local amount = Random(3, 9)
        for i = 1, amount do
            spawn_something(entity, Random(60, 90), Random(150, 190), true, false, append_viewer_name)
        end
    end
end
