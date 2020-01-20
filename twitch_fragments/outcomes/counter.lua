--Counter!
--No u
--good
--6
--counters melee hits
function twitch_counter()
    local player = get_player()
    local game_effect = GetGameEffectLoadTo(player, "MELEE_COUNTER", true);
    if game_effect ~= nil then 
        ComponentSetValue(game_effect, "caused_by_stains", 1);
        ComponentSetValue(game_effect, "frames", 5400);
    end
end
