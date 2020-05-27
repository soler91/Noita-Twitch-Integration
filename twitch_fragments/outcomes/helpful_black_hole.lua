--Helpful Blackhole
--It's trying its best
--unknown
--10
--todo
function twitch_helpful_black_hole()
    local x, y = get_player_pos()
    local black_hole = EntityLoad(
                           "data/entities/projectiles/deck/black_hole.xml", x, y);
    EntityAddComponent(black_hole, "HomingComponent", {
        target_tag = "player_unit",
        homing_targeting_coeff = "30.0",
        homing_velocity_multiplier = "0.99",
        detect_distance = "300"
    });
    local projectile = FindFirstComponentByType(black_hole,
                                                "ProjectileComponent");
    if projectile ~= nil then ComponentSetValue(projectile, "lifetime", 300); end
end
