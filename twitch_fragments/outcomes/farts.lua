--Farts
--Geez what did you eat!?
--perks
--30
--todo
function twitch_farts()
    if GlobalsGetValue("twitch_farts_active", "0") == "1" then
        return nil
    end
    local BADGE = {
        sprite="data/twitch/badges/farts.png",
        long_name="twitch_badge_farts",
        name="Farts",
        description="You release flammable gas."
    }
    local player = get_player()
    local badge = make_badge(BADGE)
    EntityAddChild(get_player(), badge)
    local game_effect = GetGameEffectLoadTo(player, "FARTS", true);
    if game_effect ~= nil then 
        ComponentSetValue(game_effect, "frames", -1);
        GlobalsSetValue("twitch_farts_active", "1")
    end
end
