--Tripping Balls
--Your reality has beeen balled
--bad_effects
--210
--todo
function twitch_shift()
    local player = get_player()
    local fungi = CellFactory_GetType("fungi")
    EntityIngestMaterial( player, fungi, 300 )
    empty_player_stomach()
end
