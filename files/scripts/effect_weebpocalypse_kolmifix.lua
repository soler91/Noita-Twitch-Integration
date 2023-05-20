
function death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )

    local entity_id = GetUpdatedEntityID()
    local pos_x, pos_y = EntityGetTransform(entity_id)
    EntityLoad("data/entities/buildings/teleport_ending_victory_delay.xml", pos_x, pos_y)

end
