--Fiery Circle
--Now that's hot
--enviromental
--110
--todo
function twitch_fire_trap()
	async(function()
		for i = 0, 3, 1 do
			spawn_entity_in_view_random_angle("data/entities/projectiles/deck/circle_fire.xml", 55, 110)
			wait(240 - (i * 50))
		end
	end)
end
