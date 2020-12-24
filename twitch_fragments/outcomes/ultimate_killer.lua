--Ultimate Killer
--Get ready...
--enemies
--30
--Spawns the ultimate killer
function twitch_ultimate_killer()
    spawn_entity_in_view_random_angle("data/entities/animals/ultimate_killer.xml", 60, 120, 20, function(entity_id)
        GetGameEffectLoadTo( entity_id, "CHARM", true )
        for i=1, 4 do
            speedup_enemy(entity_id)
        end
        append_viewer_name(entity_id)
    end)
end
