function death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
    local entity_id = GetUpdatedEntityID()
    local x, y = EntityGetTransform(entity_id)
    local player = EntityGetClosestWithTag(x, y, "mortal")

    local children = EntityGetAllChildren(entity_thats_responsible)
    for _, child in ipairs(children) do
        if (EntityGetName(child) == "twitch_name") then
            local sprite_component = EntityGetFirstComponent(child, "SpriteComponent")
            if (sprite_component) then
                local twitch_name = ComponentGetValue2(sprite_component, "text")
                GamePrintImportant("KILLED BY " .. twitch_name, "Better luck next time")
                return nil;
            end
        end
    end
end