local projFile = GlobalsGetValue("TI_randomproj","healshot")
local threat_icon = GlobalsGetValue("TI_randomprojicon","randomatk_easy.png")
local threatlevel = tonumber(GlobalsGetValue("TI_randomprojthreat","1"))
local plyr_x,plyr_y = EntityGetTransform(GetUpdatedEntityID())

local targets = EntityGetInRadiusWithTag(plyr_x, plyr_y, 256, "enemy")
for k=1,#targets
do v = targets[k]
    if EntityHasTag(v, "ti_randomized") == false then
        local pos_x, pos_y = EntityGetTransform(v)

        local comp = EntityGetFirstComponentIncludingDisabled(v,"AnimalAIComponent")
        if comp then
            ComponentSetValue2( comp, "attack_ranged_entity_file", "data/entities/projectiles/" .. projFile .. ".xml" )
            if (projFile == "healshot") or (projFile == "healshot_safe_haven") or (projFile == "healshot_slow") or (projFile == "invisshot") or (projFile == "shieldshot") or (projFile == "shieldshot_small") then
                ComponentSetValue2( comp, "tries_to_ranged_attack_friends", true )
                ComponentSetValue2( comp, "attack_if_damaged_probability", 0 )
                ComponentSetValue2( comp, "escape_if_damaged_probability", 100 )
                ComponentSetValue2( comp, "attack_ranged_enabled", true )
                --GamePrint("My status on shooting friends is true and my projectile is " .. projFile)
            else 
                ComponentSetValue2( comp, "tries_to_ranged_attack_friends", false )
                ComponentSetValue2( comp, "attack_ranged_enabled", true )
                --GamePrint("My status on shooting friends is false and my projectile is " .. projFile)
            end
        end

        local attackComp = EntityGetComponentIncludingDisabled(v, "AIAttackComponent" )
        if attackComp then
            for z=1,#attackComp
            do local c = attackComp[z] 
                ComponentSetValue2( c, "attack_ranged_entity_file", "data/entities/projectiles/" .. projFile .. ".xml" )
            end
        end

        --Add threat icon over creature's head
        --Needs to be a sub-entity because...????
        local uiicon = EntityLoad("mods/Twitch-integration/files/entities/misc/effect_enemy_randomised.xml", pos_x, pos_y)
		EntityAddComponent2(
			uiicon,
			"UIIconComponent",
			{
                icon_sprite_file="mods/Twitch-integration/files/ui_gfx/status_indicators/" .. threat_icon,
                name="Randomized Creature",
                description="Red = Dangerous, Yellow = Medium, Easy = Weak, Purple = fast proj speed",
                is_perk=true,
                display_above_head=true,
                display_in_hud=true,
			}
		)

        if threatlevel > 2 then
            EntityAddComponent2(
                uiicon,
                "LuaComponent",
                {
                    script_shot="mods/Twitch-integration/files/scripts/proj_slowdown_20.lua",
                    execute_every_n_frame=-1,
                }
            )
        end

        EntityAddChild(v,uiicon)

        EntityAddTag(v,"ti_randomized")
    end
end