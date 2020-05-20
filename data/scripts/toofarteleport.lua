dofile( "data/scripts/lib/utilities.lua" );
local entity = GetUpdatedEntityID();
local players = EntityGetWithTag( "player_unit" ) or {};
if #players > 0 then
    local player = players[1];
    local x, y = EntityGetTransform( entity );
    local px, py = EntityGetTransform( player );
    local dx, dy = px - x, py - y;
    local distance_squared = dx * dx + dy * dy;
    -- 256 * 256 = 65536
    if distance_squared > 65536 then
        EntitySetTransform( entity, px, py );
    end
end
