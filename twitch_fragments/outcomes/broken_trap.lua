--Broken Trap
--As long as it stays broken...
--traps
--15
--some random comment
function twitch_broken_trap()

	local px, py = get_player_pos()
    
	local xx = 225
	local yy = 10
	local rx = 0
	local ry = 0
	local size = 16
	local torque = 2100;
	local hp = 0.2; -- two spark bolts to kill
	
	local x, y = GetRandomPosition(px - xx, py + yy, rx, ry, size)
	local ent = EntityLoad("data/entities/props/physics_trap_circle_acid.xml", x, y-2)
	SetHP(ent, hp)
	PhysicsApplyTorque(ent, torque)
	x, y = GetRandomPosition(px + xx, py + yy, rx, ry, size)
	ent = EntityLoad("data/entities/props/physics_trap_circle_acid.xml", x, y-2)
	SetHP(ent, hp)
	PhysicsApplyTorque(ent, -torque)
end

function GetRandomPosition(x, y, randX, randY, size)
	local dx = math.random(-randX, randX) / 2
	local dy = math.random(-randY, randY) / 2
	return FindFreePositionForBody( x + dx, y + dy, 0, 0, size )
end

function SetHP(id, hp)
	local comp = EntityGetComponent(id, "DamageModelComponent")
	for _, cid in pairs(comp) do
		ComponentSetValue2( cid, "hp", hp )
    end
end