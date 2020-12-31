--Spiked Drinks
--Don't take 'em from strangers
--detrimental
--60
--eeeew
function twitch_spiked_drink()
    local drinks = {
        "lava",
        "alcohol",
        "acid",
        "radioactive_liquid",
        "magic_liquid_polymorph",
        "magic_liquid_random_polymorph",
        "blood_cold"
    }
    local inventory = GetInven()
    local items = EntityGetAllChildren(inventory)
    if items ~= nil then
        for _, item_id in ipairs(items) do
            local flask_comp = EntityGetFirstComponentIncludingDisabled(item_id, "MaterialInventoryComponent")
            if flask_comp ~= nil then
                local potion_material = random_from_array(drinks)
                AddMaterialInventoryMaterial(item_id, potion_material, 150)
            end
        end
    end
end
