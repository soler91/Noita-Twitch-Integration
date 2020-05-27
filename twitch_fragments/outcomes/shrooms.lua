--Shrooms
--What a trip
--bad_effects
--1
--todo
function twitch_shrooms()
    local player = get_player()
    local drugs = EntityGetComponent(player, "DrugEffectComponent")

    local drugs = EntityAddComponent(player, "DrugEffectComponent", {
        stoned_amount = "6"
    })
end
