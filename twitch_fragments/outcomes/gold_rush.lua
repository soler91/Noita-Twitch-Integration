-- name = "Gold rush",
-- desc = "Quick, before it disappear",
function twitch_gold_rush()
    for i = 1, 30 do
        spawn_something("data/entities/items/pickup/goldnugget.xml", 30, 180)
    end
end
