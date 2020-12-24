--Angry Steve
--Steve is out to getcha!
--enemies
--80
--todo
function twitch_angry_steve()
    spawn_entity_in_view_random_angle("data/entities/animals/necromancer_shop.xml", 75, 160, 20, function(entity_id)
        EntityRemoveTag(entity_id, "necromancer_shop")
        local charm_effect = GameGetGameEffect(entity_id, "CHARM")
        if charm_effect ~= nil then
            ComponentSetValue2(charm_effect, "frames", 0)
        end
        for i=1, 2 do
            speedup_enemy(entity_id)
        end
        append_viewer_name(entity_id)
    end)
end