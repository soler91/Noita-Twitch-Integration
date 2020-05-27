--Replace wand
--Was it always like this ???
--unknown
--2
--todo
function twitch_wand_replacement()
    local inventory = GetInven()
    local inventory_items = GetWands()

    if inventory_items ~= nil then
        local replaced_wand = inventory_items[math.random(1, table.getn(
                                                              inventory_items))]
        GameKillInventoryItem(get_player(), replaced_wand)
        local item_entity = nil
        local rnd = Random(0, 1000)
        if rnd < 200 then
            item_entity = EntityLoad("data/entities/items/wand_level_01.xml")
        elseif rnd < 600 then
            item_entity = EntityLoad("data/entities/items/wand_level_02.xml")
        elseif rnd < 850 then
            item_entity = EntityLoad("data/entities/items/wand_level_03.xml")
        elseif rnd < 998 then
            item_entity = EntityLoad("data/entities/items/wand_level_04.xml")
        else
            item_entity = EntityLoad("data/entities/items/wand_level_05.xml")
        end
        EntityAddChild(inventory, item_entity)
    end
end
