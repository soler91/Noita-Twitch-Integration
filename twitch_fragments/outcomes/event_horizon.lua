--Event Horizon
--Watch your step
--enviromental
--10
--todo
function twitch_event_horizon()
    local how_many = 3;
    local min_distance = 96;
    local max_distance = 192;

    local x, y = get_player_pos()
    for i = 1, how_many do
        local distance = Random(min_distance, max_distance);
        local angle = math.random() * math.pi * 2;
        local sx, sy = x + math.cos(angle) * distance,
                       y + math.sin(angle) * distance;
        local black_hole = EntityLoad(
                               "data/entities/projectiles/deck/black_hole_big.xml",
                               sx, sy);
    end

end
