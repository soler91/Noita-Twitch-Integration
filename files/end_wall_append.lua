RegisterSpawnFunction( 0xffd4723d, "spawn_ti_explosives" )
RegisterSpawnFunction( 0xff00d6c4, "spawn_ti_canister" )
RegisterSpawnFunction( 0xffd60000, "spawn_ti_enemies" )
RegisterSpawnFunction( 0xffd6c800, "spawn_ti_props" )

ti_props = {
    "physics_chair_1.xml",
    "physics_chair_2.xml",
    "physics_box_harmless.xml",
    "stonepile.xml",
    "physics_cart.xml",
    "physics_minecart.xml"
}

function spawn_ti_canister(x, y)
    EntityLoad("data/entities/props/physics_propane_tank.xml", x, y)
end

function spawn_ti_explosives(x, y)
    EntityLoad("data/entities/props/physics_box_explosive.xml", x, y)
end

function spawn_ti_enemies(x, y)
    if (y > 3000) then
        EntityLoad("data/entities/animals/shotgunner.xml", x, y)
    else
        EntityLoad("data/entities/animals/shotgunner_weak.xml", x, y)
    end
end

function spawn_ti_props(x, y)
    SetRandomSeed( x, y )
    local rng = Random(1, #ti_props)
    local prop = ti_props[rng]
    EntityLoad("data/entities/props/" .. prop, x, y)
end