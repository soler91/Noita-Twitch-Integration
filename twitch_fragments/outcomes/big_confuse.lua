--Big Confuse
--?????????
--bad_effects
--170
--confuses player?
function twitch_big_confuse()
    local player = get_player()
    local game_effect = GetGameEffectLoadTo(player, "CONFUSION", true);
    if game_effect ~= nil then ComponentSetValue(game_effect, "frames", 600); end
end
