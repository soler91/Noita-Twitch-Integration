--Green Thumb
--A lot more useful in other games
--traps
--180
--todo
function twitch_green_thumb()
	async(function()
		for i = 0, 15, 1 do
			spawn_entity_in_view_random_angle("data/entities/props/root_grower.xml", 70, 140, 0, nil, true)
			wait(480)
		end
	end)
end