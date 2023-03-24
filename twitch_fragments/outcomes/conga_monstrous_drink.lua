--Monstrous Drink
--You'd best not pour that
--detrimental
--5
--ohno
function twitch_conga_monstrous_drink()
    local inventory = GetInven()
    local items = EntityGetAllChildren(inventory)
    if items ~= nil then
        AddMaterialInventoryMaterial(items[1], "monster_powder_test", 10)
    end
end
