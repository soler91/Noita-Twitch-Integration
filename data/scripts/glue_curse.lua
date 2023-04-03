dofile_once("data/scripts/lib/utilities.lua")

function damage_received( damage, desc, entity_who_caused, is_fatal )
	local entity_id    = GetUpdatedEntityID()
	local parent = EntityGetParent( entity_id );
	if ( entity_who_caused == entity_id ) or ( ( parent ~= 0 )  ) then return end
	
	local pos_x, pos_y = EntityGetTransform( entity_id )
	if (damage > 0 and entity_who_caused > 0) then
		shoot_projectile( entity_who_caused, "mods/twitch-integration/data/entities/projectiles/weak_glue_shot.xml", pos_x, pos_y, 0, 0 )
	end
end