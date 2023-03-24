
local entity_id = GetUpdatedEntityID()
local pos_x, pos_y = EntityGetTransform(entity_id)
local comp = EntityGetFirstComponentIncludingDisabled(entity_id,"GhostComponent")

if #EntityGetInRadiusWithTag(pos_x, pos_y, 200, "player_unit") <= 0 then
    ComponentSetValue2(comp,"speed",60)
else
    ComponentSetValue2(comp,"speed",27)
end