ModLuaFileAppend("data/scripts/status_effects/status_list.lua", "mods/twitch-integration/files/status_list_append.lua")
ModMaterialsFileAdd("mods/twitch-integration/files/materials/become_speed.xml")
ModMaterialsFileAdd("mods/twitch-integration/files/materials/big_confuse.xml")
ModMaterialsFileAdd("mods/twitch-integration/files/materials/chonky.xml")
ModMaterialsFileAdd("mods/twitch-integration/files/materials/counter.xml")
ModMaterialsFileAdd("mods/twitch-integration/files/materials/dryspell.xml")
ModMaterialsFileAdd("mods/twitch-integration/files/materials/farts.xml")
ModMaterialsFileAdd("mods/twitch-integration/files/materials/mana_overdrive.xml")
ModMaterialsFileAdd("mods/twitch-integration/files/materials/stronk.xml")
ModMaterialsFileAdd("mods/twitch-integration/files/materials/the_purge.xml")
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
	dofile("data/ws/ws.lua")
end
