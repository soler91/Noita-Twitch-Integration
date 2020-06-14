local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)
local player = EntityGetClosestWithTag(x, y, "mortal")
local childs = EntityGetAllChildren(player)
local walker_count = 0
local attacker_count = 0
local badge_count = 0
for _, child in ipairs(childs) do
    if badge_count < 1 then
        local badge = EntityGetFirstComponent(child, "UIIconComponent")
        if badge ~= nil then
            local icon = ComponentGetValue2(badge, "name")
            if icon == "$perk_attack_foot" then
                EntityKill(child)
                badge_count = badge_count + 1
            end
        end
    end
    if attacker_count < 1 then
        local attacker = EntityGetFirstComponent(child,
                                                 "IKLimbAttackerComponent")
        if attacker ~= nil then
            EntityKill(child)
            attacker_count = attacker_count + 1
        end
    end

    if walker_count < 4 then
        local walker = EntityGetFirstComponent(child, "IKLimbWalkerComponent")
        if walker ~= nil then
            EntityKill(child)
            walker_count = walker_count + 1
        end
    end
end

local platformingcomponents = EntityGetComponent(player,"CharacterPlatformingComponent")
if (platformingcomponents ~= nil) then
    for i, component in ipairs(platformingcomponents) do
        local run_speed = tonumber(ComponentGetMetaCustom(component,"run_velocity")) * 0.8
        local vel_x = math.abs(tonumber(ComponentGetMetaCustom(component,"velocity_max_x"))) * 0.8

        local vel_x_min = 0 - vel_x
        local vel_x_max = vel_x

        ComponentSetMetaCustom(component, "run_velocity", run_speed)
        ComponentSetMetaCustom(component, "velocity_min_x", vel_x_min)
        ComponentSetMetaCustom(component, "velocity_max_x", vel_x_max)
    end
end