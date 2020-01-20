--The Purge
--BATTLE ROYALE
--unknown
--44
--Everyone against eachother
function twitch_the_purge()
    async(function()
        local world_entity_id = GameGetWorldStateEntity()
        if (world_entity_id ~= nil) then
            local comp_worldstate = EntityGetFirstComponent(world_entity_id,"WorldStateComponent")
            if (comp_worldstate ~= nil) then
                local global_genome_relations_modifier = tonumber(ComponentGetValue(comp_worldstate,"global_genome_relations_modifier"))
                ComponentSetValue(comp_worldstate, "global_genome_relations_modifier", "-200")
                wait(60*90)
                ComponentSetValue(comp_worldstate, "global_genome_relations_modifier", tostring(global_genome_relations_modifier))
            end
        end
    end)
end
