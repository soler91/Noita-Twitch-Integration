local projPoolFast = {
    uiicon = "randomatk_purple.png",
    threatlevel = 3,
    options = {
        "arrow",
        "bossdragon",
        "bossdragon_ray",
        "darkflame",
        "enlightened_laser_dark_wand",
        "enlightened_laser_elec_wand",
        "enlightened_laser_fire_wand",
        "enlightened_laser_light_wand",
        "machinegun_bullet_tank_super",
        "megalaser_blue",
        "megalaser_blue_beam",
        "neutralizershot",
        "orb_hearty",
        "orb_homing",
        "orb_neutral",
        "orb_green_boss_dragon",
        "orb_pink_fast",
        --"orb_pink_super",
        --"orb_poly",
        "orb_purple",
        "orb_swapper",
        "orb_tele",
        "orb_tiny",
        "orb_twitchy",
        "orb_weaken",
        "orb_wither",
        "orb_weaken",
        "orb_wither",
        "rocket_tank",
        "laser_bouncy",
        "laserbeam",
        "laserbeam_green",
        "laser_lasergun",
        "laser_spear",
        "laser_turret",
        "sentryshot",
        "sniperbullet",
        --"soldiershot",
        "wraith_glowing_laser",
        "deck/bouncy_orb",
        "deck/bubbleshot",
        "deck/bullet",
        "deck/bullet_heavy",
        "deck/bullet_slow",
        "deck/chain_bolt",
        "deck/disc_bullet",
        "deck/disc_bullet_big",
        "deck/disc_bullet_bigger",
        "deck/infestation",
        "deck/spitter",
        "deck/spitter_tier_2",
        "deck/spitter_tier_3",
        "deck/swarm_wasp",
        "deck/swarm_firebug",
        "deck/worm_shot",
        "deck/megalaser",
        "deck/light_bullet",
        "deck/spiral_shot",
        "deck/spore_pod",
    }
}

local projPoolDangerous = {
    uiicon = "randomatk_dangerous.png",
    threatlevel = 4,
    options = {
        "bomb_holy",
        "circle_acid_small",
        "circle_lava_small",
        "chaos_polymorph",
        --"meteor_green", 300+ damage in a single hit
        "freeze_circle",
        "orb_dark",
        "orb_pink_big_super_shrapnel",
        "remove_ground",
        --"lightning", Kind of just unfun as a stunlock
        "pollen_ball",
        --"polyorb",
        "present",
        "thunderball_line",
        --"deck/all_deathcrosses",
        "deck/all_discs",
        --"deck/all_nukes",
        "deck/all_rockets",
        "deck/crumbling_earth",
        "deck/chaos_polymorph_field",
        "deck/grenade_tier_2",
        "deck/grenade_tier_3",
        "deck/touch_gold",
    }
}

local projPoolEasy = {
    uiicon = "randomatk_easy.png",
    threatlevel = 1,
    options = {
        "acidburst",
        "acidshot_slow",
        "chunk_of_soil",
        "bloomshot",
        "bomb",
        "bomb_cart",
        "bomb_small",
        "buckshot",
        "circle_blood_small",
        "darkflame_stationary",
        "healshot",
        "healshot_safe_haven",
        "healshot_slow",
        "invisshot",
        "mine",
        "mine_scavenger",
        "rain_gold",
        "shieldshot",
        "shieldshot_small",
        "tnt",
        "deck/all_blackholes",
        "deck/berserk_field",
        "deck/big_magic_shield_start",
        "deck/black_hole",
        "deck/cloud_acid",
        "deck/cloud_blood",
        "deck/cloud_water",
        "deck/chainsaw",
        "deck/sausage",
        "deck/water",
        "deck/xray",
        "deck/sea_water",
        "deck/material_cement",
        "deck/material_blood",
        "deck/luminous_drill",
    }
}

local projPoolMedium = {
    uiicon = "randomatk_medium.png",
    threatlevel = 2,
    options = {
    "bat",
    "cocktail",
    --"bomb_holy_giga",
    "bullet_poison",
    --"circle_water",
    "clusterbomb",
    "cocktail",
    "coward_bullet",
    "dotshot",
    "dotshot_strong",
    --"egg_fire",
    --"egg_monster",
    --"egg_purple",
    --"egg_red",
    --"egg_slime",
    --"egg_worm",
    "explosion",
    "fire_trap",
    "fireball",
    "fireball_bigfirebug",
    "fireball_firebug", 
    "fireball_ghostly",
    "flamethrower",
    "fungus",
    "fungus_big_explosion",
    "fungus_explosion",
    "gasblob",
    "glitter_bomb",
    "glue",
    "glue_shot",
    "grenade_leader",
    "grenade_scavenger",
    "hiddenshot",
    "ice",
    "iceball",
    "icethrower",
    "lavashot",
    --"meteor_green",
    "lurkershot",
    --"machinegun_bullet_roboguard_big",
    "machinegun_bullet_slow",
    "machinegun_bullet_slower",
    "machinegun_bullet_tank",
    "orb",
    "orb_blue",
    "orb_cursed",
    "orb_expanding",
    "orb_green",
    "orb_green_accelerating",
    "orb_green_spin",
    "orb_pink",
    "orb_pink_big",
    "orb_pink_big_slow",
    "orb_pink_big_super",
    "orbspawner",
    "orbspawner_blue",
    "orbspawner_green",
    "pebble",
    "pollen",
    "propane_tank",
    "radioactive_blob",
    "radioactive_blob_trail",
    "radioactive_liquid",
    --"rocket_tiny",
    --"rocket_tiny_roll",
    "slimeblob",
    "slimetrail",
    "spit_trap",
    "summonshine",
    "smalltentacle",
    "smalltentacle_melee",
    "tentacle",
    "thunder_trap",
    "thunderball",
    "thunderball_slow",
    "deck/black_hole_big",
    --"deck/black_hole_giga", hahaha... no.
    "deck/bloodtentacle",
    "deck/bomb_detonator",
    --"deck/charm_field",
    "deck/grenade",
    --"deck/sea_acid",
    --"deck/sea_alcohol",
    --"deck/sea_lava",
    "deck/wall_horizontal",
    "deck/wall_square",
    "deck/wall_vertical",
    }
}

local projTables = {projPoolFast,projPoolEasy,projPoolMedium,projPoolDangerous}

function chooseSpell(rng1,rng2)
    SetRandomSeed(rng1 + rng2, rng1 - rng2)
    local rng = Random(1,202)
    local table = 4
    if rng <= 59 then
        table = 1
    elseif rng <= 81 then
        table = 2
    elseif rng <= 113 then
        table = 3
    else    --202
        table = 4
    end
    local c = projTables[table].options
    --GamePrint("length of v is " .. #c)
    local rng2 = Random(1,#c)
    local spellid = c[rng2]
    local iconid = projTables[table].uiicon
    local threatlevel = projTables[table].threatlevel
    return spellid, iconid, threatlevel
end

local plyr_x,plyr_y = EntityGetTransform(GetUpdatedEntityID())

local targets = EntityGetInRadiusWithTag(plyr_x, plyr_y, 256, "enemy")
for k=1,#targets
do v = targets[k]
    if EntityHasTag(v, "ti_randomized") == false then
        local pos_x, pos_y = EntityGetTransform(v)
        local threat_icon = "randomatk_easy.png"
        local current_threat_level = 1
        --SetRandomSeed(pos_x + pos_y, pos_x * pos_y)

        --local projFile = projPool[Random(1,#projPool)]
        local projFile, iconid, threatlevel = chooseSpell(pos_x,pos_y)
        if current_threat_level < threatlevel then
            threat_icon = iconid
        end

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
                --SetRandomSeed(z + pos_x, z * pos_y) --Randomised additionally here so each individual AiAttackComponent has a different attack, for example, Steve will have two different projectiles for his two different attacks
                --local projFile = projPool[Random(1,#projPool)]
                local projFile, iconid, threatlevel = chooseSpell(pos_x + (z * 5),pos_y + (z * 5))
                if current_threat_level < threatlevel then
                    threat_icon = iconid
                end

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
                description="Red = Dangerous, Yellow = Medium, Green = Weak, Purple = Fast Proj Speed",
                is_perk=true,
                display_above_head=true,
                display_in_hud=true,
			}
		)

        if current_threat_level > 2 then
            EntityAddComponent2(
                v,
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