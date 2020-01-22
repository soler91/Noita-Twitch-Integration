--The Alchemic Circle
--Yikes
--unknown
--3.3
--todo
function twitch_random_circle()
    local above = false
    local rand = Random(0, 1)
    if rand > 0 then
        above = true
    end
    local mats = {
        "void_liquid",
        "oil",
        "fire",
        "blood",
        "water",
        "acid",
        "alcohol",
        "material_confusion",
        "magic_liquid_movement_faster",
        "magic_liquid_worm_attractor",
        "magic_liquid_protection_all",
        "magic_liquid_mana_regeneration",
        "magic_liquid_teleportation",
        "magic_liquid_hp_regeneration"
    };

    spawn_something("data/entities/projectiles/deck/circle_acid.xml", 80, 160, above, true, function(circle)
        async(function()
            ComponentSetValue( EntityGetFirstComponent( circle, "LifetimeComponent" ), "lifetime", "900" )
            ComponentSetValue( EntityGetFirstComponent( circle, "ParticleEmitterComponent" ), "airflow_force", "0.01" );
            ComponentSetValue( EntityGetFirstComponent( circle, "ParticleEmitterComponent" ), "image_animation_speed", "3" );
            for i = 1, 10 do
                ComponentSetValue( EntityGetFirstComponent( circle, "ParticleEmitterComponent" ), "emitted_material_name", mats[ Random( 1, #mats ) ] );
                wait(20)
            end
        end)
    end)
end