-- name = "Bomb rush",
-- desc = "You better run",
function twitch_bomb_rush()
    async(function()
        local tnt = Random(5, 9)
        local small_bombs = Random(4, 7)
        local bombs = Random(3, 5)

        for i = 1, tnt do
            spawn_item("data/entities/projectiles/tnt.xml", 0, 70)
        end

        wait(2 * 60)

        for i = 1, small_bombs do
            spawn_item("data/entities/projectiles/glitter_bomb.xml", 0, 60)
        end

        wait(4 * 60)

        for i = 1, bombs do
            spawn_item("data/entities/projectiles/bomb.xml", 0, 50)
        end

        wait(5 * 60)

        spawn_item("data/entities/projectiles/bomb_holy.xml", 140, 190, true)
    end)
end
