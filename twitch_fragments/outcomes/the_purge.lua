--The Purge
--BATTLE ROYALE
--unknown
--44
--Everyone against eachother
function twitch_the_purge()
    local duration = 60 * 90
    if GlobalsGetValue("twitch_purge_active", "0") == "1" then
        local current = tonumber(GlobalsGetValue("twitch_purge_deathframe", "0"))
        GlobalsSetValue("twitch_purge_deathframe", tostring(current + duration))
        return nil
    end
    local BADGE = {
        sprite="data/twitch/badges/the_purge.png",
        long_name="twitch_badge_purge",
        name="The Purge",
        description="Everyone hates eachother to death."
    }
    local player = get_player()
    local badge = make_badge(BADGE)
    EntityAddChild(get_player(), badge)
    local world_entity_id = GameGetWorldStateEntity()
    if (world_entity_id ~= nil) then
        local comp_worldstate = EntityGetFirstComponent(world_entity_id,"WorldStateComponent")
        if (comp_worldstate ~= nil) then
            local global_genome = ComponentGetValue(comp_worldstate,"global_genome_relations_modifier")
            GlobalsSetValue("twitch_purge_original_genome", global_genome)
            ComponentSetValue(comp_worldstate, "global_genome_relations_modifier", "-200")
        end
    end
    GlobalsSetValue("twitch_purge_active", "1")
    GlobalsSetValue("twitch_purge_deathframe", tostring(GameGetFrameNum() + duration))
end
function remove_the_purge()
    local world_entity_id = GameGetWorldStateEntity()
    if (world_entity_id ~= nil) then
        local comp_worldstate = EntityGetFirstComponent(world_entity_id,"WorldStateComponent")
        if (comp_worldstate ~= nil) then
            local global_genome = GlobalsGetValue("twitch_purge_original_genome", "0")
            ComponentSetValue(comp_worldstate, "global_genome_relations_modifier", global_genome)
        end
    end
end