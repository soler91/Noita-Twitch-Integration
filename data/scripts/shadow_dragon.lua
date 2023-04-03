dofile_once("data/scripts/lib/utilities.lua")

function damage_received( damage, desc, entity_who_caused, is_fatal )
	local entity_id    = GetUpdatedEntityID()
	local parent = EntityGetParent( entity_id );
	if ( entity_who_caused == entity_id ) or ( ( parent ~= 0 )  ) then return end
	
	local pos_x, pos_y = EntityGetTransform( entity_id )
	
	if(EntityHasTag(entity_who_caused, "boss_dragon")) then
		local dragon = entity_who_caused;

		local remainingDmg = GlobalsGetValue("ShadowDragon"..dragon)
		remainingDmg = remainingDmg - damage;
		GlobalsSetValue( "ShadowDragon"..dragon, remainingDmg )
		
		local damagemodel = EntityGetFirstComponent(entity_id, "DamageModelComponent")
		local max_hp = tonumber(ComponentGetValue(damagemodel, "max_hp"))
		local hp = tonumber(ComponentGetValue(damagemodel, "hp"))
		if(hp > max_hp/2) then
			-- dmg player until half hp at minimum
		elseif(remainingDmg < 0) then -- needs to do minimum specifid ammount of dmg before shadow remove
			shadow_despawn(dragon)
		end
	end
end

function shadow_despawn(entityId)
	local pos_x, pos_y = EntityGetTransform( entityId )
	EntityLoad("data/entities/particles/poof_pink.xml", pos_x, pos_y)

	EntitySetTransform( entityId, 0, -10000)
	EntityKill(entityId)
end