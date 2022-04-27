local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)
local owner = EntityGetClosestWithTag(x, y, "mortal")

local character_data_component = EntityGetFirstComponent(owner, "CharacterDataComponent")
local character_platforming_component = EntityGetFirstComponent(owner, "CharacterPlatformingComponent")

local destroy_ground = ComponentGetValue2(character_data_component, "destroy_ground")
local eff_hg_size_x = ComponentGetValue2(character_data_component, "eff_hg_size_x")
local eff_hg_size_y = ComponentGetValue2(character_data_component, "eff_hg_size_y")
local eff_hg_damage_min = ComponentGetValue2(character_data_component, "eff_hg_damage_min")
local eff_hg_damage_max = ComponentGetValue2(character_data_component, "eff_hg_damage_max")
local pixel_gravity = ComponentGetValue2(character_platforming_component, "pixel_gravity")

ComponentSetValue2(character_data_component, "destroy_ground", destroy_ground - 69)
ComponentSetValue2(character_data_component, "eff_hg_size_x", eff_hg_size_x - 12)
ComponentSetValue2(character_data_component, "eff_hg_size_y", eff_hg_size_y - 4)
ComponentSetValue2(character_data_component, "eff_hg_damage_min", eff_hg_damage_min - 500)
ComponentSetValue2(character_data_component, "eff_hg_damage_max", eff_hg_damage_max - 1500)
