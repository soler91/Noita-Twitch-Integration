local entity = GetUpdatedEntityID();
local x, y = EntityGetTransform( entity );
local players = EntityGetInRadiusWithTag( x, y, 64, "player_unit" ) or {};
if #players == 0 then
    local game_effect = GetGameEffectLoadTo( entity, "CHARM", true );
    if game_effect ~= nil then
        ComponentSetValue( game_effect, "frames", 10 );
    end
end