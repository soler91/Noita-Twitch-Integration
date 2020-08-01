--Frozen prison
--It sure is chilly in here.
--enviromental
--80
--todo
function twitch_ice_cage()
    local x, y = get_player_pos()
	LoadPixelScene("mods/twitch-integration/files/pixel_scenes/ice_cage.png","",x - 50, y - 65, "", true)
end
