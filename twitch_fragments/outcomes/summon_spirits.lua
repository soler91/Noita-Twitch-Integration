--Summon Spirits
--One is not like the other
--enemies
--110
--todo
function twitch_summon_spirits()
	spawn_entity_in_view_random_angle("data/entities/animals/fireskull.xml", 80, 110, 10, append_viewer_name)
	spawn_entity_in_view_random_angle("data/entities/animals/iceskull.xml", 115, 140, 10, append_viewer_name)
	spawn_entity_in_view_random_angle("data/entities/projectiles/deck/mist_alcohol.xml", 32, 33, 20)
end