--Random Wand
--WOW!!
--good
--18
--todo
function twitch_random_wand()
    local rnd = Random(0, 1000)
    if rnd < 200 then
        spawn_item("data/entities/items/wand_level_01.xml")
    elseif rnd < 600 then
        spawn_item("data/entities/items/wand_level_02.xml")
    elseif rnd < 850 then
        spawn_item("data/entities/items/wand_level_03.xml")
    elseif rnd < 998 then
        spawn_item("data/entities/items/wand_level_04.xml")
    else
        spawn_item("data/entities/items/wand_level_05.xml")
    end
end
