
function CheckCollapseGate()
	local countString = GlobalsGetValue("twitch_collapse_gate", "0")
	local countNumber = tonumber(countString)
	if(countNumber > 0) then
		--GamePrint("Gate ".. countString)
		local px, py = EntityGetTransform(EntityGetWithTag( "player_unit" )[1])
		local teleports = EntityGetWithTag("not_collapsed_gate")
		for i,v in ipairs(teleports) do 
			local x, y = EntityGetTransform(v)
			if(py + 50 < y) then
				BlockExit(v)
				countNumber = countNumber - 1
				if(countNumber < 1) then break end
			end
		end
	end
end

function BlockExit(entity_id)
	EntityRemoveTag(entity_id, "not_collapsed_gate")
	local countString = GlobalsGetValue("twitch_collapse_gate", "0")
	local countNumber = tonumber(countString) - 1
	GlobalsSetValue("twitch_collapse_gate", tostring(countNumber))
	CollapseGate(entity_id)
end

function CollapseGate(entity_id)
	local rad = 30
	local x, y, rot, sx, sy = EntityGetTransform(entity_id)
	for i = 1, 3 do
        SpawnFast("data/entities/props/physics_chair_1.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_chair_1.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_chair_2.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_chair_2.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_chair_2.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_box_harmless.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_box_harmless.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_box_harmless.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_box_harmless.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_box_harmless.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_box_harmless.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_box_harmless.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_box_explosive.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_propane_tank.xml", x, y, rad)
        SpawnFast("data/entities/props/stonepile.xml", x, y, rad)
        SpawnFast("data/entities/props/stonepile.xml", x, y, rad)
        SpawnFast("data/entities/props/stonepile.xml", x, y, rad)
        SpawnFast("data/entities/props/stonepile.xml", x, y, rad)
        SpawnFast("data/entities/props/stonepile.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_cart.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_minecart.xml", x, y, rad)
    end
end

function SpawnFast(path, x, y, rad)
	x = x + Random(-rad, rad)
	y = y + Random(-rad, rad)
	EntityLoad(path, x, y)
end