--THE MOIST MOB
--Slurp slurp slurp
--enemies
--300
--todo
function twitch_moist_mob()
    local rnd = Random(10, 20)
    spawn_something("data/entities/animals/frog_big.xml", 30, 180, true)
    for i = 1, rnd do
        spawn_something("data/entities/animals/frog.xml", 50, 150, true)
    end
end