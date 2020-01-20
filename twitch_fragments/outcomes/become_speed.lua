--Become speed
--I AM SPEED
--unknown
--30
--
function twitch_become_speed()
    local player = get_player()
    for i=1, 2 do
        local game_effect = GetGameEffectLoadTo(player, "MOVEMENT_FASTER_2X", true);
        if game_effect ~= nil then ComponentSetValue(game_effect, "frames", 1800); end
    end
end
