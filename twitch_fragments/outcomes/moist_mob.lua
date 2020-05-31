--THE MOIST MOB
--Slurp slurp slurp
--enemies
--150
--todo
function twitch_moist_mob()
    local rnd = Random(10, 20)
    spawn_something("data/entities/animals/frog_big.xml", 30, 180, true, false, append_viewer_name)
    for i = 1, rnd do
        spawn_something("data/entities/animals/frog.xml", 50, 150, true, false, append_viewer_name)
    end
end