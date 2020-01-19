--ACID??
--Who thought this was a good idea
--bad
--25
--some random comment
function twitch_acid_trap()
    local above = false
    local rand = Random(0, 1)
    if rand > 0 then above = true end
    spawn_something("data/entities/projectiles/deck/circle_acid.xml", 70, 180,
                    above, true)
end
