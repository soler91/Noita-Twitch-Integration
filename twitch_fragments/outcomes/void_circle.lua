--Avoid the Void!™️
--It's time to play AVOID!! THE!! VOID!!
--unknown
--50
--todo
function twitch_void_circle()
    local above = false
    local rand = Random(0, 1)
    if rand > 0 then above = true end
    spawn_something("data/entities/projectiles/deck/circle_acid.xml", 50, 130, above, true, function(circle)
        ComponentSetValue( EntityGetFirstComponent( circle, "ParticleEmitterComponent" ), "emitted_material_name", "void_liquid" );
    end)
end