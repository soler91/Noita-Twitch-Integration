--Random Flask
--What's in it?
--unknown
--15
--todo
function twitch_random_flask()
    local potion_material = ""
    if (Random(0, 100) <= 75) then
        if (Random(0, 100000) <= 50) then
            potion_material = "magic_liquid_hp_regeneration"
        elseif (Random(200, 100000) <= 250) then
            potion_material = "purifying_powder"
        else
            potion_material = random_from_array(potion_materials_magic)
        end
    else
        potion_material = random_from_array(potion_materials_standard)
    end
    local x, y = get_player_pos()
    -- just go ahead and assume cheatgui is installed
    local entity = EntityLoad("data/entities/items/pickup/twitch_flask.xml", x, y)
    AddMaterialInventoryMaterial(entity, potion_material, 1000)
end
