--Bomb Rush
--BOOM
--bad
--30
--Spawns waves of explosives, TNT -> Spark bomb -> Bomb -> Holy Bomb (Far from player)
function twitch_bomb_rush()
    async(function()
        local TEXT = {
            font="data/fonts/terminal_font.xml",
            string="3",
            offset_x="4",
            offset_y="26",
            alpha="0.50",
            scale_x="2",
            scale_y="2"
        }
        local timer = append_text(get_player(), TEXT)
        
        local tnt = Random(5, 9)
        local small_bombs = Random(4, 7)
        local bombs = Random(3, 5)

        for i=1, 3 do
            wait(60)
            local num = tonumber(TEXT.string) - i
            ComponentSetValue( timer, "text", tostring(num) )
        end
        wait(60)
        EntityRemoveComponent(get_player(), timer)

        GameScreenshake( 100 )
        for i = 1, tnt do
            spawn_item("data/entities/projectiles/tnt.xml", 0, 70)
        end

        TEXT.string = "2"
        timer = append_text(get_player(), TEXT)
        for i=1, 2 do
            wait(60)
            local num = tonumber(TEXT.string) - i
            ComponentSetValue( timer, "text", tostring(num) )
        end
        wait(60)
        EntityRemoveComponent(get_player(), timer)

        GameScreenshake( 200 )
        for i = 1, small_bombs do
            spawn_item("data/entities/projectiles/glitter_bomb.xml", 0, 60)
        end

        TEXT.string = "4"
        timer = append_text(get_player(), TEXT)
        for i=1, 4 do
            wait(60)
            local num = tonumber(TEXT.string) - i
            ComponentSetValue( timer, "text", tostring(num) )
        end
        wait(60)
        EntityRemoveComponent(get_player(), timer)

        GameScreenshake( 400 )
        for i = 1, bombs do
            spawn_item("data/entities/projectiles/bomb.xml", 0, 50)
        end

        TEXT.string = "5"
        timer = append_text(get_player(), TEXT)
        for i=1, 5 do
            wait(60)
            local num = tonumber(TEXT.string) - i
            ComponentSetValue( timer, "text", tostring(num) )
        end
        wait(60)
        EntityRemoveComponent(get_player(), timer)
        GameScreenshake( 1000 )
        spawn_item("data/entities/projectiles/bomb_holy.xml", 140, 190, true)
    end)
end
