player = EntityGetWithTag("player_unit")[1]
if player then
	x, y = EntityGetTransform(player)
	local enemies = EntityGetInRadiusWithTag(x, y, 512, "enemy")
	for i = 1, #enemies, 1 do
		local enemy = enemies[i]
		if EntityGetName(enemy) ~= "$animal_boss_limbs" and EntityGetName(enemy) ~= "$animal_boss_centipede" and EntityHasTag("TI_SUGAR") == false then
			local animal_ai_comp = EntityGetComponentIncludingDisabled(enemy, "AnimalAIComponent")
      if (animal_ai_comp ~= nil and animal_ai_comp > 0) then
        ComponentSetValue2(animal_ai_comp, "creature_detection_range_x", 256)
        ComponentSetValue2(animal_ai_comp, "creature_detection_range_y", 256)
        ComponentSetValue2(animal_ai_comp, "creature_detection_angular_range_deg", 360)
        ComponentSetValue2(animal_ai_comp, "creature_detection_check_every_x_frames", 10)
        ComponentSetValue2(animal_ai_comp, "aggressiveness_min", 99)
        ComponentSetValue2(animal_ai_comp, "aggressiveness_max", 100)
        ComponentSetValue2(animal_ai_comp, "sense_creatures_through_walls", true)
        EntityAddTag(enemy, TI_SUGAR)
      end
		end
	end
end