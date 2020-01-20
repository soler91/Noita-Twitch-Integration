--Farts
--Geez what did you eat!?
--unknown
--30
--todo
function twitch_farts()
    local player = get_player()
    local game_effect = GetGameEffectLoadTo(player, "FARTS", true);
    if game_effect ~= nil then 
        ComponentSetValue(game_effect, "frames", -1);
    end
end
