function CheckCollapseGate()
    local countString = GlobalsGetValue("twitch_collapse_gate", "0")
    local countNumber = tonumber(countString)
    if (countNumber > 0) then
        -- GamePrint("Gate ".. countString)
        local px, py = EntityGetTransform(EntityGetWithTag("player_unit")[1])
        local teleports = EntityGetWithTag("not_collapsed_gate")
        for i, v in ipairs(teleports) do
            local x, y = EntityGetTransform(v)
			if (py + 50 < y and y - py < 235) then
				local rand = Random(0, 1)
                if (rand > 0) then
                    BlockExitScene(v)
                else
                    BlockExit(v)
                end
                countNumber = countNumber - 1
                if (countNumber < 1) then break end
            end
        end

    end
end

function BlockExitScene(entity_id)
    local x, y = EntityGetTransform(entity_id)
    EntityRemoveTag(entity_id, "not_collapsed_gate")
    local countString = GlobalsGetValue("twitch_collapse_gate", "0")
    local countNumber = tonumber(countString) - 1
    GlobalsSetValue("twitch_collapse_gate", tostring(countNumber))
    LoadPixelScene("mods/twitch-integration/files/pixel_scenes/block_exit.png", "", x - 192, y - 90, "", true)
end

function BlockExit(entity_id)
    EntityRemoveTag(entity_id, "not_collapsed_gate")
    local countString = GlobalsGetValue("twitch_collapse_gate", "0")
    local countNumber = tonumber(countString) - 1
    GlobalsSetValue("twitch_collapse_gate", tostring(countNumber))
    CollapseGate(entity_id)
end

function CollapseGate(entity_id)
    local rad = 30
    local x, y, rot, sx, sy = EntityGetTransform(entity_id)
    for i = 1, 3 do
        SpawnFast("data/entities/props/physics_chair_1.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_chair_1.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_chair_1.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_chair_2.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_chair_2.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_chair_2.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_box_harmless.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_box_harmless.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_box_harmless.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_box_harmless.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_box_harmless.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_box_harmless.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_box_harmless.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_box_explosive.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_propane_tank.xml", x, y, rad)
        SpawnFast("data/entities/props/stonepile.xml", x, y, rad)
        SpawnFast("data/entities/props/stonepile.xml", x, y, rad)
        SpawnFast("data/entities/props/stonepile.xml", x, y, rad)
        SpawnFast("data/entities/props/stonepile.xml", x, y, rad)
        SpawnFast("data/entities/props/stonepile.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_cart.xml", x, y, rad)
        SpawnFast("data/entities/props/physics_minecart.xml", x, y, rad)
    end

    local points = y
    while points > 3000 do
        SpawnFast("data/entities/animals/shotgunner.xml", x, y - 65, 10)
        points = points - 3000
    end
    while points > 1050 do
        SpawnFast("data/entities/animals/shotgunner_weak.xml", x, y - 65, 10)
        points = points - 1050
    end
end

function SpawnFast(path, x, y, rad)
    x = x + Random(-rad, rad)
    y = y + Random(-rad, rad)
    EntityLoad(path, x, y)
end

function MirageWand()
    local countString = GlobalsGetValue("twitch_mirage_wand", "0")
    local countNumber = tonumber(countString)
    if (countNumber > 0) then
        local id = EntityGetWithTag("player_unit")[1]
        local x, y = EntityGetTransform(id)
        local wands = EntityGetWithTag("wand")

        for index, wandId in ipairs(wands) do
            if (not IsPlayer(EntityGetRootEntity(wandId)) and
                not EntityHasTag(wandId, "mirage_safe")) then
                local wx, wy = EntityGetTransform(wandId)
                local distance = math.max(math.abs(wx - x), math.abs(wy - y))
                if (distance < 25) then
                    local r = math.random(100)
                    if (r > 69) then
                        EntityLoad("data/entities/particles/poof_pink.xml", wx,
                                   wy)
                        EntityKill(wandId)
                        GlobalsSetValue("twitch_mirage_wand",
                                        tostring(countNumber - 1))
                    else
                        EntityAddTag(wandId, "mirage_safe")
                    end
                end
            end

        end
    end
end
