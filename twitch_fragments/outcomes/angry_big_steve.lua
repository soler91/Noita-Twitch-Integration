--Angry BIG Steve
--Scott? is out to getcha!
--enemies
--70
--todo
function twitch_angry_big_steve()
    spawn_entity_in_view_random_angle("data/entities/animals/necromancer_super.xml", 75, 160, 20, function(entity_id)
        EntityRemoveTag(entity_id, "necromancer_shop")
        append_viewer_name(entity_id)
    end)
end