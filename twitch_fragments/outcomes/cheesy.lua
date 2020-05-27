--Cheese
--GIVE ME THE CHEESE
--enviromental
--10
--todo
function twitch_cheesy()
    async(function()
        local px, py = get_player_pos()
        local entity = EntityLoad("data/entities/cheesy.xml", px, py)
    end)
end
