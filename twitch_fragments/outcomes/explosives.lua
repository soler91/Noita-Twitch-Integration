--Explosives
--Might cause explosions
--bad
--37
--todo
barrel_entities = {
    "data/entities/props/physics_propane_tank.xml",
    "data/entities/props/physics_pressure_tank.xml",
    "data/entities/props/physics_box_explosive.xml",
    "data/entities/props/physics_barrel_oil.xml",
    "data/entities/props/physics_barrel_radioactive.xml"
}
function twitch_explosives()
    async(function()
        for i = 1, 350 do
            local barrel = random_from_array(barrel_entities)
            local x = generate_value_in_range(1200, 20, 0)
            local y = generate_value_in_range(1200, 20, 0)
            spawn_prop(barrel, x, y)
        end
    end)
end
