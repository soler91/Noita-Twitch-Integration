--Become speed
--I AM SPEED
--bad_effects
--250
--
function twitch_become_speed()
    local duration = 60 * 30

    if GlobalsGetValue("twitch_speed_active", "0") == "1" then
        local current = tonumber(GlobalsGetValue("twitch_speed_deathframe", "0"))
        GlobalsSetValue("twitch_speed_deathframe", tostring(current + duration))
        local comp = GlobalsGetValue("twitch_speed_comp")
        local frames = ComponentGetValue(tonumber(comp), "frames")
        ComponentSetValue(tonumber(comp), "frames", tostring(frames + duration))
        return nil
    end
    local BADGE = {
        sprite="data/twitch/badges/become_speed.png",
        long_name="twitch_badge_speed",
        name="I AM SPEED",
        description="Faster than sanic."
    }
    local player = get_player()
    local badge = make_badge(BADGE)
    EntityAddChild(get_player(), badge)
    
    local game_effect = GetGameEffectLoadTo(player, "MOVEMENT_FASTER_2X", true);
    if game_effect ~= nil then ComponentSetValue(game_effect, "frames", tostring(duration)); end

    GlobalsSetValue("twitch_speed_comp", tostring(game_effect))
    GlobalsSetValue("twitch_speed_active", "1")
    GlobalsSetValue("twitch_speed_deathframe", tostring(GameGetFrameNum() + duration))
end
