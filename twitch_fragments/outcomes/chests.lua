--Chests
--Which one is the real one?
--traps
--225
--Spawns mimics and a chest
function twitch_chests()
    for i = 1, 5 do
        spawn_something("data/entities/animals/chest_mimic.xml",30, 190)
    end
    spawn_something("data/entities/items/pickup/chest_random.xml", 50, 160)
end
