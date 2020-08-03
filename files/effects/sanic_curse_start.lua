local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)
local owner = EntityGetClosestWithTag(x, y, "mortal")

EntityAddComponent( owner, "LuaComponent", {
    enable_coroutines = "1",
    execute_every_n_frame = "-1",
    script_damage_received = "mods/twitch-integration/files/effects/sanic_curse_damage.lua"
})