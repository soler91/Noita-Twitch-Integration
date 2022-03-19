player = EntityGetWithTag("player_unit")[1]

if player then
	x, y = EntityGetTransform(player)
	local enemies = EntityGetInRadiusWithTag(x, y, 256, "enemy")
	for i = 1, #enemies, 1 do
		local enemy = enemies[i]
		if EntityGetName(enemy) ~= "$animal_necromancer_shop" and EntityGetName(enemy) ~= "$animal_necromancer_super" and EntityGetName(enemy) ~= "$animal_boss_limbs" and EntityGetName(enemy) ~= "$animal_boss_centipede" then
			eX, eY = EntityGetTransform(enemy)
			EntityLoad("data/entities/animals/necromancer_shop.xml", eX, eY)
			EntityKill(enemy)
		end
	end
end