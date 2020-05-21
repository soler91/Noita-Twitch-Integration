-- Blindness
-- Good luck
-- bad
-- 7
-- todo
function twitch_blindness()
    local player = get_player()
    local game_effect = GetGameEffectLoadTo(player, "BLINDNESS", false);
    if game_effect ~= nil then ComponentSetValue(game_effect, "frames", 600); end
end
