--Dryspell
--Cool?
--good
--50
--todo
function twitch_dryspell()
    local duration = 60 * 240

    if GlobalsGetValue("twitch_dryspell_active", "0") == "1" then
        local current = tonumber(GlobalsGetValue("twitch_dryspell_deathframe", "0"))
        GlobalsSetValue("twitch_dryspell_deathframe", tostring(current + duration))
        return nil
    end
    
    local BADGE = {
        sprite="data/twitch/badges/dryspell.png",
        long_name="twitch_badge_dryspell",
        name="Dryspell",
        description="Dries liquids around you."
    }
    local badge = make_badge(BADGE)
    local px, py = get_player_pos()
    local dry_entity = EntityLoad("data/entities/dryspell.xml", px, py)

    EntityAddChild(get_player(), dry_entity)
    EntityAddChild(get_player(), badge)

    GlobalsSetValue("twitch_dryspell_active", "1")
    GlobalsSetValue("twitch_dryspell_deathframe", tostring(GameGetFrameNum() + duration))
end
function remove_dryspell()
    local childs = EntityGetAllChildren(get_player())
    if childs ~= nil then
        for _, child in ipairs(childs) do
            if EntityHasTag(child, "twitch_dryspell") then
                EntityKill(child)
                GlobalsSetValue("twitch_dryspell_active", "0")
            end
        end
    end
end