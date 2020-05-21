--Mana Overdrive
--Lots of mana for now
--good
--5
--todo
function twitch_mana_overdrive()
    local player = get_player()
    for i = 1, 5 do
        local game_effect = GetGameEffectLoadTo(player, "MANA_REGENERATION", true);
        if game_effect ~= nil then ComponentSetValue(game_effect, "frames", 3600); end
    end
end
