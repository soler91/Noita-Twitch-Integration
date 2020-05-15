--Bloody Mess
--Blood all over me
--unknown
--10
--todo
function twitch_bloody_mess()
    async(function()
        local px, py = get_player_pos()
        local entity = EntityLoad("data/entities/bloody.xml", px, py)
    end)
end
