--CHONKY
--That's one CHONKY Noita
--perks
--180
--Makes the player stomp cause damage to the terrain
function twitch_chonky()
    local duration = 60 * 120

    if GlobalsGetValue("twitch_chonky_active", "0") == "1" then
        local current = tonumber(GlobalsGetValue("twitch_chonky_deathframe", "0"))
        GlobalsSetValue("twitch_chonky_deathframe", tostring(current + duration))
        return nil
    end
    local BADGE = {
        sprite="data/twitch/badges/chonky.png",
        long_name="twitch_badge_chonky",
        name="Chonky",
        description="Stomp the ground."
    }
    local player = get_player()
    local badge = make_badge(BADGE)
    EntityAddChild(get_player(), badge)

    local chardatacomp = EntityGetComponent(player, "CharacterDataComponent")
    if (chardatacomp ~= nil) then
        for i, charmodel in ipairs(chardatacomp) do
            ComponentSetValue(charmodel, "eff_hg_damage_min", "80000")
            ComponentSetValue(charmodel, "eff_hg_damage_max", "150000")
            ComponentSetValue(charmodel, "eff_hg_size_x", "30")
            ComponentSetValue(charmodel, "eff_hg_size_y", "10")
            ComponentSetValue(charmodel, "destroy_ground", "1")
        end
    end
    
    GlobalsSetValue("twitch_chonky_active", "1")
    GlobalsSetValue("twitch_chonky_deathframe", tostring(GameGetFrameNum() + duration))
end
function remove_chonky()
    local player = get_player()
    if player ~= nil then
        local chardata = EntityGetComponent(player, "CharacterDataComponent")
        if (chardata ~= nil) then
            for i, model in ipairs(chardata) do
                ComponentSetValue(model, "eff_hg_damage_min", "10")
                ComponentSetValue(model, "eff_hg_damage_max", "95")
                ComponentSetValue(model, "eff_hg_size_x", "6.42857")
                ComponentSetValue(model, "eff_hg_size_y", "5.14286")
            end
        end
        GlobalsSetValue("twitch_chonky_active", "0")
    end
end