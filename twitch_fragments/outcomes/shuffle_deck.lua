--Scrambled wands
--Sorry not sorry
--detrimental
--70
--some random comment
function twitch_shuffle_deck()
    local wands = GetWands()
    if wands ~= nil then
        --TODO store charges left ? meh
        for _, wand_id in ipairs(wands) do
            local spells = {}
            local childs = EntityGetAllChildren(wand_id)

            --get stupid spells
            if childs ~= nil then
                for _, child in ipairs(childs) do
                    local action_comp = EntityGetFirstComponentIncludingDisabled(child, "ItemActionComponent")
                    local item_comp = EntityGetFirstComponentIncludingDisabled(child, "ItemComponent")
                    local action_id = ComponentGetValue2(action_comp, "action_id")
                    local is_always_cast = ComponentGetValue2(item_comp, "permanently_attached")
                    if action_id ~= nil and is_always_cast == false then
                        table.insert(spells, action_id)
                        EntityKill(child) --DEATH
                    end
                end
            end

            local shuffled = {}
            for i, v in ipairs(spells) do
                local pos = Random(1, #shuffled + 1)
                table.insert(shuffled, pos, v)
            end

            for _, spell in ipairs(shuffled) do
                local action_entity_id = CreateItemActionEntity(spell)
                if action_entity_id ~= 0 then
                    EntityAddChild(wand_id, action_entity_id)
                    EntitySetComponentsWithTagEnabled(action_entity_id, "enabled_in_world", false)
                end
            end
        end
    end
    force_refresh_wands()
end
