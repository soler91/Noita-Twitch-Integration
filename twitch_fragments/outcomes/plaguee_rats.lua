-- name = "plaGUEE rats",
-- desc = "Hail the rat king",
function twitch_plaguee_rats()
    local rats = Random(20, 30)
    local plague = Random(10, 20)
    local boss = Random(1, 2)

    for i = 1, rats do
        spawn_something("data/entities/animals/rat.xml", 30, 120, true)
    end
    for i = 1, plague do
        spawn_something("data/entities/misc/perks/plague_rats_rat.xml", 50, 160,
                        true)
    end
    for i = 1, boss do
        spawn_something("data/entities/animals/skullrat.xml", 80, 180, true)
    end
end
