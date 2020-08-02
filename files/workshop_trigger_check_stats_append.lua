_collision_trigger = _collision_trigger or collision_trigger

function collision_trigger()	
	local enemies_killed = tonumber( StatsBiomeGetValue("enemies_killed") )
	if(enemies_killed > 0) then
		local countString = GlobalsGetValue("twitch_ukko_in_box", "0")
		local ukko = tonumber(countString)
		local chance = (ukko * 2) / (ukko+3);
		if(math.random()<chance) then
			spawn_chest_like_hitless()
		end
	end
    _collision_trigger()
end

function spawn_chest_like_hitless()
	local entity_id    = GetUpdatedEntityID()
	local x, y = EntityGetTransform( entity_id )	
	local reference_id = EntityGetClosestWithTag( x, y, "workshop_reference" )
	local sx,sy = x,y	
	if ( reference_id ~= NULL_ENTITY ) then
		sx,sy = EntityGetTransform( reference_id )
		EntityLoad( "data/entities/items/pickup/chest_random.xml", sx, sy )		
	end
end