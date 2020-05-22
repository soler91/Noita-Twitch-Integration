-- NOITLOCKE
-- Is this Pokiman?!?!
-- legendary
-- 50
-- Can't edit wands at all, not even with Edit Wands Everywhere.
function twitch_noitlocke() -- Make work after game restart
    if noitlocke then return end
    noitlocke = true
    local current_wands = GetWands()
    for _, wandId in ipairs(current_wands) do
        EntityAddTag(wandId, "noitlocke_safe")
    end

    async_loop(function()
        local wands = GetWands()
        if wands == nil then return end

        for _, wandId in ipairs(wands) do
            local actions = GetWandSpells(wandId)

            if actions ~= nil then
                for __, actionId in ipairs(actions) do
                    local action_comps = EntityGetAllComponents(actionId)
                    if EntityHasTag(wandId, "noitlocke_safe") then
                        for i, c in ipairs(action_comps) do
                            if ComponentGetTypeName(c) == "ItemComponent" then
                                ComponentSetValue(c, "is_frozen", "1")
                            end
                        end
                    else
                        local itemActionName
                        for i, c in ipairs(action_comps) do
                            if ComponentGetTypeName(c) == "ItemActionComponent" then
                                itemActionName =
                                    ComponentGetValue(c, "action_id")
                            end
                        end

                        EntityRemoveFromParent(actionId)

                        local droppedAction =
                            CreateItemActionEntity(itemActionName,
                                                   get_player_pos())
                        local velocity =
                            EntityGetFirstComponent(droppedAction,
                                                    "VelocityComponent");
                        if velocity ~= nil then
                            ComponentSetValueVector2(velocity, "mVelocity",
                                                     math.random() * 90 + 35,
                                                     math.random() * -75 - 25);
                        end
                    end

                end
            end
        end
        wait(120)
    end)
end