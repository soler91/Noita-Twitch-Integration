--NOITLOCKE
--Is this Pokiman?!?!
--legendary
--50
--Can't edit wands at all, not even with Edit Wands Everywhere.
function twitch_noitlocke() --Make work after game restart
    if noitlocke then return end
    noitlocke = true
    async_loop(function()
        local wands = GetWands()
        if wands == nil then return end

        for _, wid in ipairs(wands) do
            local actions = GetWandSpells(wid)

            if actions ~= nil then
                for __, aid in ipairs(actions) do
                    local action_comps = EntityGetAllComponents(aid)
                    for i, c in ipairs(action_comps) do
                        if ComponentGetTypeName(c) == "ItemComponent" then
                            ComponentSetValue(c, "is_frozen", "1")
                        end
                    end
                end
            end
        end
        wait(120)
    end)
end
