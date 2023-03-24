dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )

local projectiles = EntityGetWithTag( "projectile" )

if ( #projectiles > 0 ) then
    for k=1,#projectiles
    do local projectile_id = projectiles[k]
		local tags = EntityGetTags( projectile_id )
		
		if ( tags == nil ) or ( string.find( tags, "ti_wormshot" ) == nil ) then
			local px, py = EntityGetTransform( projectile_id )
			local vel_x, vel_y = 0,0
			
			local projectilecomponents = EntityGetComponent( projectile_id, "ProjectileComponent" )
			local velocitycomponents = EntityGetComponent( projectile_id, "VelocityComponent" )
			
			if ( projectilecomponents ~= nil ) then
                for j=1,#projectilecomponents
                do local comp_id = projectilecomponents[j]
					ComponentSetValue( comp_id, "on_death_explode", "0" )
					ComponentSetValue( comp_id, "on_lifetime_out_explode", "0" )
				end
			end
			
			if ( velocitycomponents ~= nil ) then
				edit_component( projectile_id, "VelocityComponent", function(comp,vars)
					vel_x,vel_y = ComponentGetValueVector2( comp, "mVelocity", vel_x, vel_y)
				end)
			end
			
			shoot_projectile_from_projectile( projectile_id, "mods/Twitch-integration/files/entities/projectiles/worm_shot.xml", px, py, vel_x, vel_y )
			EntityKill( projectile_id )
		end
	end
end