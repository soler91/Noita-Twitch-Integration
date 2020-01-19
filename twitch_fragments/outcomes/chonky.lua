--CHONKY
--That's one CHONKY Noita
--unknown
--60
--Makes the player stomp cause damage to the terrain
function twitch_chonky()
    async(function()
        local playah = get_player()
        local o_min = nil
        local o_max = nil
        local o_x = nil
        local o_y = nil
        local chardatacomp =
            EntityGetComponent(playah, "CharacterDataComponent")
        if (chardatacomp ~= nil) then
            for i, charmodel in ipairs(chardatacomp) do
                local o_min = ComponentGetValue(charmodel, "eff_hg_damage_min")
                local o_max = ComponentGetValue(charmodel, "eff_hg_damage_max")
                local o_x = ComponentGetValue(charmodel, "eff_hg_size_x")
                local o_y = ComponentGetValue(charmodel, "eff_hg_size_y")

                ComponentSetValue(charmodel, "eff_hg_damage_min", "80000")
                ComponentSetValue(charmodel, "eff_hg_damage_max", "150000")
                ComponentSetValue(charmodel, "eff_hg_size_x", "30")
                ComponentSetValue(charmodel, "eff_hg_size_y", "10")
                ComponentSetValue(charmodel, "destroy_ground", "1")
            end
        end

        wait(60 * 120)
        local chardata = EntityGetComponent(get_player(),
                                            "CharacterDataComponent")
        if (chardata ~= nil) then
            for i, model in ipairs(chardata) do

                ComponentSetValue(model, "eff_hg_damage_min", o_min)
                ComponentSetValue(model, "eff_hg_damage_max", o_max)
                ComponentSetValue(model, "eff_hg_size_x", o_x)
                ComponentSetValue(model, "eff_hg_size_y", o_y)
            end
        end
    end)
end
