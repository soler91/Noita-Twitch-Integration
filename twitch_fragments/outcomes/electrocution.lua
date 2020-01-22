--Electrocution
--Positively shocking!
--bad
--6
--electrocutes player
function twitch_electrocution()
    local player = get_player()
    local game_effect = GetGameEffectLoadTo( player, "ELECTROCUTION", true );
    if game_effect ~= nil then ComponentSetValue( game_effect, "frames", 120 ); end
end
