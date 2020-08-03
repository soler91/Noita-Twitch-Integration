function shot(shot_id)
    local entity_id = GetUpdatedEntityID()
    local x, y = EntityGetTransform(entity_id)
    local owner = EntityGetClosestWithTag(x, y, "mortal")

    local wallet_component = EntityGetFirstComponent(owner, "WalletComponent")
    if (wallet_component) then
        local money = tonumber(ComponentGetValue2(wallet_component, "money"))
        if (money > 3) then
            ComponentSetValue2(wallet_component, "money", money - 3)
            local projectile_component = EntityGetFirstComponent(shot_id, "ProjectileComponent")
            if (projectile_component ~= nil) then
                local damage = tonumber(ComponentGetValue2(projectile_component, "damage"))
                ComponentSetValue2(projectile_component, "damage", damage + 0.4)
            end
        end
    end
end