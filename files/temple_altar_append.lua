_spawn_all_shopitems = _spawn_all_shopitems or spawn_all_shopitems

function spawn_all_shopitems(x, y)
    _spawn_all_shopitems(x, y)
    local clutter = tonumber(GlobalsGetValue("twitch_cluttershops", "0"))
    if (clutter > 0) then
        local rad = 30
        local x2 = x + 60
        for i = 1, 3 do
            SpawnFast("data/entities/props/physics_chair_1.xml", x2, y, rad)
            SpawnFast("data/entities/props/physics_chair_1.xml", x2, y, rad)
            SpawnFast("data/entities/props/physics_chair_1.xml", x2, y, rad)
            SpawnFast("data/entities/props/physics_chair_2.xml", x2, y, rad)
            SpawnFast("data/entities/props/physics_chair_2.xml", x2, y, rad)
            SpawnFast("data/entities/props/physics_box_harmless.xml", x2, y, rad)
            SpawnFast("data/entities/props/physics_box_harmless.xml", x2, y, rad)
            SpawnFast("data/entities/props/physics_box_harmless.xml", x2, y, rad)
            SpawnFast("data/entities/props/physics_box_harmless.xml", x2, y, rad)
            SpawnFast("data/entities/props/physics_box_harmless.xml", x2, y, rad)
            SpawnFast("data/entities/props/physics_box_harmless.xml", x2, y, rad)
            SpawnFast("data/entities/props/physics_box_harmless.xml", x2, y, rad)
            SpawnFast("data/entities/props/physics_box_harmless.xml", x2, y, rad)
            SpawnFast("data/entities/props/physics_box_harmless.xml", x2, y, rad)
            SpawnFast("data/entities/props/stonepile.xml", x2, y, rad)
            SpawnFast("data/entities/props/stonepile.xml", x2, y, rad)
            SpawnFast("data/entities/props/stonepile.xml", x2, y, rad)
            SpawnFast("data/entities/props/stonepile.xml", x2, y, rad)
            SpawnFast("data/entities/props/stonepile.xml", x2, y, rad)
            SpawnFast("data/entities/props/stonepile.xml", x2, y, rad)
            SpawnFast("data/entities/props/physics_cart.xml", x2, y, rad)
            SpawnFast("data/entities/props/physics_minecart.xml", x2, y, rad)
        end
        GlobalsSetValue("twitch_cluttershops", tostring(clutter - 1))
    end
end

function SpawnFast(path, x, y, rad)
    x = x + Random(-rad, rad)
    y = y + Random(-rad, rad)
    EntityLoad(path, x, y)
end