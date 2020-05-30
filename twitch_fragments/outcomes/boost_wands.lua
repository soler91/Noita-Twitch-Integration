--Boost Wands
--Lucky you!!
--helpful
--50
--Boosts wand stats of 1 to 4 wands (in order)\nAlways boosts Mana, Mana Regen and capacity\n50% chance to boost Cast delay\n50% chance to boost Recharge delay\n50% chance to reduce Spread\n50% chance to remove Shuffle
function twitch_boost_wands()
    local wands = GetWands()
    if wands == nil then return end
    local to_boost = Random(1, table.getn(wands))

    for i = 1, to_boost do
        local ability = EntityGetAllComponents(wands[i])
        local boost_speed = Random(0, 1)
        local boost_recharge = Random(0, 1)
        local reduce_spread = Random(0, 1)
        local unshuffle = Random(0, 1)
        for _, c in ipairs(ability) do
            if ComponentGetTypeName(c) == "AbilityComponent" then
                local mana_max = tonumber(ComponentGetValue(c, "mana_max"))
                local mana_charge = tonumber(
                                        ComponentGetValue(c, "mana_charge_speed"))
                local deck_capacity = tonumber(
                                          ComponentObjectGetValue(c,
                                                                  "gun_config",
                                                                  "deck_capacity"))
                mana_max = mana_max + Random(20, 50)
                mana_charge = mana_charge + Random(20, 50)
                deck_capacity = deck_capacity + Random(1, 5)
                ComponentSetValue(c, "mana_max", tostring(mana_max))
                ComponentSetValue(c, "mana_charge_speed", tostring(mana_charge))
                ComponentObjectSetValue(c, "gun_config", "deck_capacity",
                                        tostring(deck_capacity))
                if boost_recharge > 0 then
                    local cur_recharge =
                        ComponentObjectGetValue(c, "gun_config", "reload_time")
                    cur_recharge = cur_recharge - 20
                    ComponentObjectSetValue(c, "gun_config", "reload_time",
                                            tostring(cur_recharge))
                end
                if boost_speed > 0 then
                    local cur_speed = ComponentObjectGetValue(c,
                                                              "gunaction_config",
                                                              "fire_rate_wait")
                    cur_speed = cur_speed - 20
                    ComponentObjectSetValue(c, "gunaction_config",
                                            "fire_rate_wait",
                                            tostring(cur_speed))
                end
                if reduce_spread > 0 then
                    local cur_spread = ComponentObjectGetValue(c,
                                                               "gunaction_config",
                                                               "spread_degrees")
                    cur_spread = cur_spread - 10
                    ComponentObjectSetValue(c, "gunaction_config",
                                            "spread_degrees",
                                            tostring(cur_spread))
                end
                if unshuffle > 0 then
                    cur = 0
                    ComponentObjectSetValue(c, "gun_config",
                                            "shuffle_deck_when_empty",
                                            tostring(cur))
                end
            end
        end
    end
end
