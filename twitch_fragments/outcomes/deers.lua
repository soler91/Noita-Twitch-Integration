--Deers
--Oh dear...
--unknown
--50
--Spawns some normal deers with deercoys mixed in
function twitch_deers()
    for i = 1, 5 do
        spawn_something("data/entities/projectiles/deck/exploding_deer.xml",
                        100, 300)
        spawn_something("data/entities/animals/deer.xml", 100, 300)
    end
end
