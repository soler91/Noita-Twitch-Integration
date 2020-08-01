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

function GetBestPoint(x, y, distance, resolution)
	local bestScore = -10
	local bestAngle = 0
	local bestDistance = 0
	local seed = math.floor(math.random(0,resolution))
	
	for i = seed, resolution - 1 + seed do
	
		local hit2, hx2, hy2, a2 = Raycast(x, y, distance, i/resolution - (1/resolution/2))
		local hit1, hx1, hy1, a1 = Raycast(x, y, distance, i/resolution)
		local hit3, hx3, hy3, a3 = Raycast(x, y, distance, i/resolution + (1/resolution/2))
		
		local mid = dist(x, y, hx1, hy1)
		local score = mid + dist(x, y, hx2, hy2) + dist(x, y, hx3, hy3)
		if(bestScore < score) then
			bestScore = score
			bestAngle = a1
			bestDistance = math.sqrt(mid)
		end
	end
	
	return bestAngle, bestDistance
end

function Raycast(x, y, distance, fraction)
	local angle = fraction * math.pi * 2
	x, y = ToPointFromDirection(x,y,10, angle)
	local sx, sy = ToPointFromDirection(x,y,distance-10, angle)
	local hit, hx, hy = RaytracePlatforms(x, y, sx, sy)
	return hit, hx, hy, angle;
end

function ToPointFromDirection(x, y, distance, angle)
	local sx, sy = x + math.cos(angle) * distance,
				   y + math.sin(angle) * distance;
    return sx, sy
end

function dist(x, y, sx, sy)
	return ((sx-x)*(sx-x)) + ((sy-y)*(sy-y))
end