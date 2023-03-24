--Monstrous Drink
--You'd best not pour that
--detrimental
--5
--ohno
function twitch_conga_monstrous_drink()
    local inventory = GetInven()
    local items = EntityGetAllChildren(inventory)
    local potiontable = {}
    SetRandomSeed( GameGetFrameNum(), GameGetFrameNum() + 8 )
    if items ~= nil then
        for k=1,#items
        do v = items[k]
            if EntityHasTag(v,"potion") == true then
                table.insert(potiontable,v)
            end
        end
        if #potiontable >= 1 then
            AddMaterialInventoryMaterial(potiontable[Random(1,#potiontable)], "monster_powder_test", 10)
        end
    end
end
