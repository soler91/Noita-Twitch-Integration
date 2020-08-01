--Secret Ending
--Jebaited!
--detrimental
--350
--Spawns the portal to the hentai dimension (tentacles)
function twitch_secret_ending()
	local x, y = get_player_pos()		
	local a, d = GetBestPoint(x, y, 120, 17)
	if(d > 70) then d = 70 end
	local r = math.random(0.5,1)
	local px, py = ToPointFromDirection(x, y, d * r, a)
	EntityLoad("data/entities/projectiles/deck/black_hole.xml", px, py)
	EntityLoad("data/entities/projectiles/deck/tentacle_portal.xml", px, py )
end