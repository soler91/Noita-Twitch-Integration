--Earthquake!
--Take cover!
--enviromental
--20
--todo
function twitch_earthquake()
	local x, y = get_player_pos()
	local hit, hx, hy = RaytracePlatforms(x, y, x, y - 500)
	EntityLoad("data/entities/projectiles/deck/crumbling_earth.xml", hx, (y+hy)/2)
end
