-- name = "Deers",
-- desc = "Oh dear!",
function twitch_deers()
    for i = 1, 5 do
        spawn_something("data/entities/projectiles/deck/exploding_deer.xml",
                        100, 300)
        spawn_something("data/entities/animals/deer.xml", 100, 300)
    end
end
