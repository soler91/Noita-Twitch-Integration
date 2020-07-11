--Rogue Black Hole
--It's on a collision path
--enviromental
--70
--todo
function twitch_rogue_black_hole()
	async(function()
		local distance = 180;
		local samples = 20;
		
		local x, y = get_player_pos()		
		local tx, ty, angle = GetTunelDirectionFromPoint2(x, y, distance, samples)
		
		local bhc = 0;
		local sx, sy = tx + math.cos(angle) * distance,
					   ty + math.sin(angle) * distance;

		local black_hole = EntityLoad(
							   "data/entities/projectiles/deck/black_hole_big.xml",
							   sx, sy);
		wait(0)
		local ability = EntityGetAllComponents(black_hole)
		
		local grav = 100;
		local max_speed = 50;
		local lifetime = 60*15;
		for _, c in ipairs(ability) do
			if ComponentGetTypeName(c) == "VelocityComponent" then
				ComponentSetValue(c, "gravity_x", tostring(math.cos(angle)*(-grav)))
				ComponentSetValue(c, "gravity_y", tostring(math.sin(angle)*(-grav)))
				ComponentSetValue(c, "terminal_velocity", tostring(max_speed))
			end
			if ComponentGetTypeName(c) == "ProjectileComponent" then
				ComponentSetValue(c, "lifetime", tostring(lifetime))
				ComponentSetValue(c, "collide_with_world", tostring(0))
			end
			if ComponentGetTypeName(c) == "ParticleEmitterComponent" then
				ComponentSetValue(c, "attractor_force", tostring(0))
			end
			if ComponentGetTypeName(c) == "BlackHoleComponent" then
				bhc = c;
			end
		end
		
		async(function()
			while EntityGetIsAlive(black_hole) do
				ComponentSetValue(bhc, "particle_attractor_force", tostring(3.75))
				wait(2)
			end
		end)
    end)
end

function DistanceFromLineMany(a,b,c, aX,aY) -- ax + by + c = 0 | by = -ax - c
	local top = 0
	for k, v in pairs(aX) do
		local dis = a * aX[k] + b * aY[k] + c;
		top = top + dis*dis;
	end
	return top/(a*a+b*b);
end

function PointToLine(x, y, a)
	if( a == 90) then a = 90.5; end
	if( a == 270) then a = 270.5; end
	local radian = a * math.pi / 180;
	-- m =  tan(angle)
	local m = math.tan(radian);
	-- n = startPoint_Y - (tan ( angle) * startPoint_X )
	local n = y - m * x;
	-- m*x + n = y 
	return -m, 1, -n, radian;
end


function GetTunelDirectionFromPoint2(x, y, distance, resolution)
local pointX = {};
	local pointY = {};
	table.insert(pointX, x);
	table.insert(pointY, y);
	
	for i = 0, resolution - 1 do
		local angle = i / resolution * math.pi * 2
		local sx, sy = x + math.cos(angle) * distance,
					   y + math.sin(angle) * distance;
					   
	    local hit, hx, hy = RaytracePlatforms(x, y, sx, sy)
		table.insert(pointX, hx);
		table.insert(pointY, hy);
		
		--EntityLoad( "data/entities/particles/poof_pink.xml", hx, hy )
	end
	
	local angleMin = nil
	local distance = nil
	
	for i = 0, 180 do
		local a,b,c, angleRad = PointToLine(x, y, i)
		local dist = DistanceFromLineMany(a,b,c, pointX, pointY)
		if distance == nil or distance > dist then
			angleMin = angleRad;
			distance = dist
		end
	end
	--GamePrint(angleMin)
	if math.random(0,2) == 0 then angleMin = angleMin + math.pi end
	
	return x, y, angleMin
end























