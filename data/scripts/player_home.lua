local entity = GetUpdatedEntityID();
local players = EntityGetWithTag( "player_unit" ) or {};
if #players > 0 then
    local tx, ty = EntityGetTransform( players[1] );
    local animal_ais = EntityGetComponent( entity, "AnimalAIComponent" ) or {};
    for _, animal_ai in pairs( animal_ais ) do
        ComponentSetValueVector2( animal_ai, "mHomePosition", tx, ty );
    end
end