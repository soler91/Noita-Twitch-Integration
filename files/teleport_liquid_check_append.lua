local _material_area_checker_success = material_area_checker_success
function material_area_checker_success( pos_x, pos_y )
	local id = GetUpdatedEntityID()
    if (not EntityHasTag(id, "teleport_gate")) then
        EntityAddTag( id, "teleport_gate" )
        EntityAddTag( id, "not_collapsed_gate" )        
    end
        material_area_checker_success(pos_x, pos_y)
end