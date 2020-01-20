--Blindness
--Good luck
--bad
--7
--todo
function twitch_blindness()
    for _,player_entity in pairs( get_players() ) do
        local game_effect = GetGameEffectLoadTo( player_entity, "BLINDNESS", false );
        if game_effect ~= nil then
            ComponentSetValue( game_effect, "frames", 600 );
        end
    end
end
