--Earthquake!
--Take cover!
--enviromental
--20
--todo
function twitch_earthquake()
	async(function()
		local x, y = get_player_pos()
		local hit, hx, hy = RaytracePlatforms(x, y, x, y - 500)
		local yy = (y+hy)/2;
		EntityLoad("data/entities/particles/image_emitters/magical_symbol.xml", hx, yy)
		wait(45)
		EntityLoad("data/entities/projectiles/deck/crumbling_earth.xml", hx, yy)
	end)
end
