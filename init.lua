ModLuaFileAppend("data/scripts/status_effects/status_list.lua", "mods/twitch-integration/files/status_list_append.lua")
--
ModLuaFileAppend("data/scripts/biomes/temple_altar.lua", "mods/twitch-integration/files/temple_altar_append.lua")
ModLuaFileAppend("data/scripts/biomes/temple_altar_right.lua", "mods/twitch-integration/files/temple_append.lua")
ModLuaFileAppend("data/scripts/biomes/temple_altar_right_snowcave.lua", "mods/twitch-integration/files/temple_append.lua")
ModLuaFileAppend("data/scripts/biomes/temple_altar_right_snowcastle.lua", "mods/twitch-integration/files/temple_append.lua")

ModLuaFileAppend("data/scripts/buildings/workshop_trigger_check_stats.lua", "mods/twitch-integration/files/workshop_trigger_check_stats_append.lua")

ModLuaFileAppend("data/scripts/biomes/temple_wall.lua", "mods/twitch-integration/files/end_wall_append.lua")
ModLuaFileAppend("data/scripts/biomes/temple_wall_ending.lua", "mods/twitch-integration/files/end_wall_append.lua")

ModLuaFileAppend("data/scripts/buildings/teleport_liquid_check.lua", "mods/twitch-integration/files/teleport_liquid_check_append.lua")

ModMaterialsFileAdd("mods/twitch-integration/files/materials/become_speed.xml")
ModMaterialsFileAdd("mods/twitch-integration/files/materials/big_confuse.xml")
ModMaterialsFileAdd("mods/twitch-integration/files/materials/chonky.xml")
ModMaterialsFileAdd("mods/twitch-integration/files/materials/counter.xml")
ModMaterialsFileAdd("mods/twitch-integration/files/materials/dryspell.xml")
ModMaterialsFileAdd("mods/twitch-integration/files/materials/farts.xml")
ModMaterialsFileAdd("mods/twitch-integration/files/materials/mana_overdrive.xml")
ModMaterialsFileAdd("mods/twitch-integration/files/materials/stronk.xml")
ModMaterialsFileAdd("mods/twitch-integration/files/materials/the_purge.xml")
ModMaterialsFileAdd("mods/twitch-integration/files/materials/sanic_curse.xml")
ModMaterialsFileAdd("mods/twitch-integration/files/materials/moneyshot.xml")
function OnModPreInit()
	-- Nothing to do but this function has to exist
end

function OnModInit()
	-- Nothing to do but this function has to exist
end

function OnModPostInit()
	-- Nothing to do but this function has to exist
end

function OnWorldPreUpdate()
	-- Nothing to do but this function has to exist
end

function OnWorldPostUpdate() 
	if _ws_main then _ws_main() end
end

function OnPlayerSpawned( player_entity )
	EntityAddComponent( player_entity, "LuaComponent", {
		execute_every_n_frame = "-1",
		script_death = "mods/twitch-integration/files/player_death.lua"
	})
	dofile("data/ws/ws.lua")
end
