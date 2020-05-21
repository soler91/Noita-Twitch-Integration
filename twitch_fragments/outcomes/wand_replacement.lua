-- Replace wand
-- Was it always like this ???
-- unknown
-- 2
-- todo
function twitch_wand_replacement()
    local inventory = GetInven()
    local inventory_items = GetWands()

    if inventory_items ~= nil then
        local replaced_wand = inventory_items[math.random(1, table.getn(
                                                              inventory_items))]
        GameKillInventoryItem(get_player(), replaced_wand)
        local item_entity = EntityLoad("data/entities/random_wand.xml")
        EntityAddChild(inventory, item_entity)
    end
end
