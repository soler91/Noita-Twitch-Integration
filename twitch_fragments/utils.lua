async_loop(function()
    local gate = GlobalsGetValue("twitch_collapse_gate", "0")
    local wandmirage = GlobalsGetValue("twitch_mirage_wand", "0")

    if (gate ~= "0") then CheckCollapseGate() end

    if (wandmirage ~= "0") then MirageWand() end

    if (#twitch_viewers > 0 and GameGetFrameNum() % 300 == 0) then
        local x, y = get_player_pos()
        for _, entity in pairs(EntityGetInRadiusWithTag(x, y, 4096, "enemy") or {}) do
            if (EntityHasTag(entity, "dont_append_name") == false) then
                
                local r = math.random(100)
                if (r > 60) then
                    append_viewer_name(entity)
                    EntityAddTag(entity, "dont_append_name")
                else
                    EntityAddTag(entity, "dont_append_name")
                end
            end
        end
    end
    wait(10)
end)
