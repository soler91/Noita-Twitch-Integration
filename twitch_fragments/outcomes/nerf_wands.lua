-- name = "NERF WANDS",
-- desc = "Oh no.. at least it has better mana ?!",
function twitch_nerf_wands()
    local wands = GetWands()
    if wands == nil then return end
    local to_boost = Random(1, table.getn(wands))

    for i = 1, to_boost do
        local ability = EntityGetAllComponents(wands[i])
        local nerf_speed = Random(0, 1)
        local nerf_recharge = Random(0, 1)
        local add_spread = Random(0, 1)
        local shuffle = Random(0, 1)
        for _, c in ipairs(ability) do
            if ComponentGetTypeName(c) == "AbilityComponent" then
                local mana_max = tonumber(ComponentGetValue(c, "mana_max"))
                local mana_charge = tonumber(
                                        ComponentGetValue(c, "mana_charge_speed"))
                mana_max = mana_max + Random(20, 50)
                mana_charge = mana_charge + Random(20, 50)
                ComponentSetValue(c, "mana_max", tostring(mana_max))
                ComponentSetValue(c, "mana_charge_speed", tostring(mana_charge))

                if nerf_recharge > 0 then
                    local cur_recharge =
                        ComponentObjectGetValue(c, "gun_config", "reload_time")
                    cur_recharge = cur_recharge + 20
                    ComponentObjectSetValue(c, "gun_config", "reload_time",
                                            tostring(cur_recharge))
                end
                if nerf_speed > 0 then
                    local cur_speed = ComponentObjectGetValue(c,
                                                              "gunaction_config",
                                                              "fire_rate_wait")
                    cur_speed = cur_speed + 20
                    ComponentObjectSetValue(c, "gunaction_config",
                                            "fire_rate_wait",
                                            tostring(cur_speed))
                end
                if add_spread > 0 then
                    local cur_spread = ComponentObjectGetValue(c,
                                                               "gunaction_config",
                                                               "spread_degrees")
                    cur_spread = cur_spread + 5
                    ComponentObjectSetValue(c, "gunaction_config",
                                            "spread_degrees",
                                            tostring(cur_spread))
                end
                if shuffle > 0 then
                    cur = 1
                    ComponentObjectSetValue(c, "gun_config",
                                            "shuffle_deck_when_empty",
                                            tostring(cur))
                end
            end
        end
    end
end
