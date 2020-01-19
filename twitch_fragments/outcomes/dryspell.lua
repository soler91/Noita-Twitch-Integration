--Dryspell
--Cool?
--good
--50
--todo
function twitch_dryspell()
    async(function()
        local px, py = get_player_pos()
        local dry_entity = EntityLoad("data/entities/dryspell.xml", px, py)
        EntityAddChild(get_player(), dry_entity)
        wait(60 * 240) --Make duration stack
        EntityKill(dry_entity)
    end)
end
