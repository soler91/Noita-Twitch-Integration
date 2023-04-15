dofile_once("data/scripts/lib/utilities.lua")

function shot( entity_id )

    local comp = EntityGetFirstComponentIncludingDisabled(entity_id,"VelocityComponent")
    local vel_x, vel_y = ComponentGetValueVector2( comp, "mVelocity", vel_x, vel_y)
    vel_x = vel_x * 0.8
    vel_y = vel_y * 0.8
    ComponentSetValueVector2( comp, "mVelocity", vel_x, vel_y)

end