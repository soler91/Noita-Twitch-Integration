--Lava pit
--Watch your step
--enviromental
--80
--todo
function twitch_lava_sea()
    local x, y = get_player_pos()
	LoadPixelScene("mods/twitch-integration/files/pixel_scenes/lava_pit.png","mods/twitch-integration/files/pixel_scenes/lava_pit_visuals.png", x - 250, y, "", true)
end
