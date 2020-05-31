--Lava pit
--Watch your step
--enviromental
--80
--todo
function twitch_lava_sea()
    local x, y = get_player_pos()
	local digger = EntityCreateNew()
	EntityAddComponent(digger, "CellEaterComponent", {
		radius = "164",
		eat_probability = "1000000000",
		eat_dynamic_physics_bodies = "1"
	})
	EntityAddComponent(digger, "LifetimeComponent", {
		lifetime = "1"
	})
	EntitySetTransform(digger, x, y + 90)
	EntityLoad("data/entities/projectiles/deck/sea_lava.xml", x, y + 50)
end
