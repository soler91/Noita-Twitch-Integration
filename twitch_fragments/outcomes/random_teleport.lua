--Random Teleport
--Where'd ya go?!?!?
--bad
--3
--todo
function twitch_random_teleport()
    local player = get_player()
    local game_effect = GetGameEffectLoadTo(player, "TELEPORTATION", true);
    if game_effect ~= nil then ComponentSetValue(game_effect, "frames", 60); end
end
