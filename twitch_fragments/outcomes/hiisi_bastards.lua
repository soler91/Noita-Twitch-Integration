--Hiisi Bastards
--Them bastards
--enemies
--150
--todo
function twitch_hiisi_bastards()
    local rng = Random(1, 2)
    local hiisi = {
        strong = {
            "data/entities/animals/shotgunner.xml",
            "data/entities/animals/animal_miner.xml"
        },
        weak = {
            "data/entities/animals/shotgunner_weak.xml",
            "data/entities/animals/miner_weak.xml"
        }
    }
    local selected = "weak"
    if rng == 2 then
        selected = "strong"
    end

    for _, entity in pairs(hiisi[selected]) do
        local amount = Random(1, 3)
        for i = 1, amount do
            spawn_something(entity, Random(60, 90), Random(150, 190), true, false, append_viewer_name)
        end
    end
end
