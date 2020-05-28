--Counter!
--No u
--good_effects
--300
--counters melee hits
function twitch_counter()
    local duration = 60 * 120

    if GlobalsGetValue("twitch_counter_active", "0") == "1" then
        local current = tonumber(GlobalsGetValue("twitch_counter_deathframe", "0"))
        GlobalsSetValue("twitch_counter_deathframe", tostring(current + duration))
        local comp = GlobalsGetValue("twitch_counter_comp")
        local frames = ComponentGetValue(tonumber(comp), "frames")
        ComponentSetValue(tonumber(comp), "frames", tostring(frames + duration))
        return nil
    end
    local BADGE = {
        sprite="data/twitch/badges/counter.png",
        long_name="twitch_badge_counter",
        name="Counter",
        description="Reflect melee damage."
    }
    local player = get_player()
    local badge = make_badge(BADGE)
    EntityAddChild(get_player(), badge)
    local game_effect = GetGameEffectLoadTo(player, "MELEE_COUNTER", true);
    if game_effect ~= nil then 
        ComponentSetValue(game_effect, "caused_by_stains", 1);
        ComponentSetValue(game_effect, "frames", 5400);
        GlobalsSetValue("twitch_counter_comp", tostring(game_effect))
        GlobalsSetValue("twitch_counter_active", "1")
        GlobalsSetValue("twitch_counter_deathframe", tostring(GameGetFrameNum() + duration))
    end
end
--