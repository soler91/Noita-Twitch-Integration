--Stronk
--Very stronk for a bit
--good_effects
--3
--todo
function twitch_stronk()
    local player = get_player()
    for i = 1, 2 do
        local game_effect = GetGameEffectLoadTo(player, "DAMAGE_MULTIPLIER", true);
        if game_effect ~= nil then ComponentSetValue(game_effect, "frames", 3600); end
    end
end
