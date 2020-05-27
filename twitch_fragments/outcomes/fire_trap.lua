--Fiery Circle
--Now that's hot
--enviromental
--40
--todo
function twitch_fire_trap()
    local above = false
    local rand = Random(0, 1)
    if rand > 0 then above = true end
    spawn_something("data/entities/projectiles/deck/circle_fire.xml", 70, 180,
                    above, true)
end
