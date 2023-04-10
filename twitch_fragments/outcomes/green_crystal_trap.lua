--Curse of the Temple
--Don't die to the curse
--enviromental
--70
--todo
function twitch_green_crystal_trap()
	async(function()
		for i = 0, 15, 1 do
			async(function()
				local x, y = get_point_in_view_random_angle(100-i*10,300-i*20,20, true, -70+i*5)
				local ent = EntityLoad("data/entities/particles/particle_explosion/main_swirly_green.xml", x, y)
				wait(10+i*3)
				local ent = EntityLoad("mods/twitch-integration/data/entities/crystal_green_effect.xml", x, y)
			end)
			wait(45-i)
		end
	end)
end

function get_point_in_view_random_angle(min_distance, max_distance, safety, inEmpty, under)
	safety = safety or 20
	if inEmpty ~= true then inEmpty = false end	
	
	local x, y, hit, hx, hy, angle
	repeat
		wait(1)
		local fraction = math.random();
		x, y = get_player_pos()
		hit, hx, hy, angle = Raycast(x, y, max_distance+10, fraction)
	until(hit == inEmpty and dist(x, y, hx, hy) > (min_distance*min_distance) and dist(x, y, hx, hy) < (max_distance*max_distance) and hy > y + under)
	
	return hx, hy
end