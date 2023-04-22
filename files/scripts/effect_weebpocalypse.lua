
local player_id = GetUpdatedEntityID()
local plyr_x, plyr_y = EntityGetTransform(player_id)
local filepath = "data/entities/animals"
if plyr_y >= 6300 then
    filepath = "data/entities/animals/crypt"
end

local targets = EntityGetInRadiusWithTag(plyr_x, plyr_y, 256, "enemy")
for k=1,#targets
do local v = targets[k]
    if EntityHasTag(v, "ti_weebed") == false then
        local x,y = EntityGetTransform(v)
        local rng = math.random(1,4)
        local weeb = 0
        local weeb2 = 0
        if rng <= 2 then
            weeb = EntityLoad(filepath .. "/tentacler_small.xml",x,y)
            weeb2 = EntityLoad(filepath .. "/tentacler_small.xml",x,y)
        elseif rng == 3 then
            weeb = EntityLoad(filepath .. "/tentacler.xml",x,y)
        else
        --    weeb = EntityLoad("data/entities/animals/TI/waifu.xml",x,y)
            weeb = EntityLoad(filepath .. "/tentacler.xml",x,y)
        end
        EntityAddTag(weeb,"ti_weebed")
        if weeb2 > 0 then
            EntityAddTag(weeb2,"ti_weebed")
        end

        EntityLoad("data/entities/particles/polymorph_explosion.xml",x,y)
        --GamePlaySound( "data/audio/Desktop/misc.bank", "game_effect/polymorph/create", x,y )

        if EntityHasTag(v, "boss") then
            EntityAddComponent2(
                weeb,
                "LuaComponent",
                {
                    execute_on_added = false,
                    script_death = "mods/Twitch-Integration/files/scripts/effect_weebpocalypse_kolmifix.lua",
                    execute_every_n_frame = -1,
                    remove_after_executed = false,
                    execute_times=-1
                }
            )
        end
		EntityKill(v)
    end
end