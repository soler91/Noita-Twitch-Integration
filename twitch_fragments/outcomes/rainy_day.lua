--Rainy Day
--Some rain on your parade
--unknown
--220
--todo
function twitch_rainy_day()
    local material_choices = {
        "blood", "radioactive_liquid", "water", "slime", "magic_liquid_charm", "acid", "lava"
    };
    local min_distance = 24;
    local max_distance = 36;

    local x, y = get_player_pos()
    SetRandomSeed(GameGetFrameNum(), x + y);
    local chosen_material = material_choices[Random(1, #material_choices)];
    local distance = Random(min_distance, max_distance);
    local angle = math.rad(-90);
    local sx, sy = x + math.cos(angle) * distance,
                   y + math.sin(angle) * distance;
    local cloud = EntityLoad("data/entities/projectiles/deck/cloud_water.xml",
                             sx, sy);
    local cloud_children = EntityGetAllChildren(cloud) or {};
    for _, cloud_child in pairs(cloud_children) do
        local child_components = EntityGetComponent(cloud_child,
                                                    "ParticleEmitterComponent") or
                                     {};
        for _, component in pairs(child_components) do
            if ComponentGetValue(component, "emitted_material_name") == "water" then
                ComponentSetValue(component, "emitted_material_name",
                                  chosen_material);
                break
            end
        end
    end

end
