--Add Orb
--e
--bad_effects
--1
--todo
function twitch_mountain_orb()
    async(
        function()
            local id = 0
            local already_picked = GameGetOrbCollectedThisRun(id)
            if (already_picked) then
                local nope = false
                for i=1, 11 do
                    nope = GameGetOrbCollectedThisRun(id)
                    if (nope == false) then
                        id = i
                        break
                    end
                end

                if (nope) then
                    GamePrint("Yo chat, dont vote on this.")
                    return nil
                end
            end
            
            local orb = EntityLoad("mods/twitch-integration/files/entities/forced_orb.xml", get_player_pos())
            local orbcomp = EntityGetFirstComponent(orb, "OrbComponent")
            ComponentSetValue2(orbcomp, "orb_id", id)
            local itemcomp = EntityGetFirstComponent(orb, "ItemComponent")
            ComponentSetValue2(itemcomp, "auto_pickup", true)
            wait(10)
            local x, y = get_player_pos()
            EntitySetTransform(orb, x, y)
        end
    )
end
