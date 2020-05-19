--Broken Trap
--As long as it stays broken...
--bad
--15
--some random comment
function twitch_broken_trap()

	local id = EntityGetWithTag( "player_unit" )[1]
	local px, py = EntityGetTransform(id)
    
	local xx = 350
	local yy = 100
	local rx = 200
	local ry = 300
	local size = 15
	
	local x, y = GetRandomPosition(px - xx, py + yy, rx, ry, size)
	EntityLoad("data/entities/props/physics_trap_circle_acid.xml", x, y)
	x, y = GetRandomPosition(px + xx, py + yy, rx, ry, size)
	EntityLoad("data/entities/props/physics_trap_circle_acid.xml", x, y)
end

function GetRandomPosition(x, y, randX, randY, size)
	local dx = math.random(-randX, randX) / 2
	local dy = math.random(-randY, randY) / 2
	return FindFreePositionForBody( x + dx, y + dy, 0, 0, size )
end