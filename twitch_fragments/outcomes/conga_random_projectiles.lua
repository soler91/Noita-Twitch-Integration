--Randomise Enemy Attacks
--Creature Corruption
--curses
--110
--
function twitch_conga_random_projectiles()
    local players = EntityGetWithTag("player_unit")
    for k=1,#players
    do v = players[k]
        local x,y = EntityGetTransform(player)
        local c = EntityLoad("mods/Twitch-integration/files/entities/misc/effect_random_projectiles.xml",x,y)
        EntityAddChild(v,c)
    end
end

