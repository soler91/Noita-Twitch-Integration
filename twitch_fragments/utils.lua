async_loop(function()

    local dryspell = GlobalsGetValue("twitch_dryspell_active", "0")
    local chonky = GlobalsGetValue("twitch_chonky_active", "0")
    local purge = GlobalsGetValue("twitch_purge_active", "0")
    local speed = GlobalsGetValue("twitch_speed_active", "0")
    local counter = GlobalsGetValue("twitch_counter_active", "0")
    local gate = GlobalsGetValue("twitch_collapse_gate", "0")
	local wandmirage = GlobalsGetValue("twitch_mirage_wand", "0")

    if dryspell == "1" then
        local dryspell_deathframe = tonumber(GlobalsGetValue("twitch_dryspell_deathframe", "0"))
        if GameGetFrameNum() >= dryspell_deathframe then
            remove_badge("twitch_badge_dryspell")
            remove_dryspell()
        end
    end

    if chonky == "1" then
        local chonky_deathframe = tonumber(GlobalsGetValue("twitch_chonky_deathframe", "0"))

        if GameGetFrameNum() >= chonky_deathframe then
            remove_badge("twitch_badge_chonky")
            remove_chonky()
        end
    end

    if purge == "1" then
        local purge_deathframe = tonumber(GlobalsGetValue("twitch_purge_deathframe", "0"))

        if GameGetFrameNum() >= purge_deathframe then
            remove_badge("twitch_badge_purge")
            remove_the_purge()
        end
    end

    if speed == "1" then
        local speed_deathframe = tonumber(GlobalsGetValue("twitch_speed_deathframe", "0"))

        if GameGetFrameNum() >= speed_deathframe then
            remove_badge("twitch_badge_speed")
            GlobalsSetValue("twitch_speed_active", "0")
        end
    end

    if counter == "1" then
        local counter_deathframe = tonumber(GlobalsGetValue("twitch_counter_deathframe", "0"))

        if GameGetFrameNum() >= counter_deathframe then
            remove_badge("twitch_badge_counter")
            GlobalsSetValue("twitch_counter_active", "0")
        end
    end
	
    if(gate ~= "0") then 
        CheckCollapseGate()
    end
	
	if(wandmirage ~= "0") then
		MirageWand()
	end
	
    wait(10)
end)