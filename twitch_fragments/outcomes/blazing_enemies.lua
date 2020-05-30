--Blazing Enemies
--Spicy
--curses
--150
--todo
function twitch_blazing_enemies()
    local x, y = get_player_pos()
    for _, entity in pairs(EntityGetInRadiusWithTag(x, y, 1024, "enemy") or {}) do
        GetGameEffectLoadTo( entity, "PROTECTION_FIRE", true );
        EntityAddComponent( entity, "ShotEffectComponent", { extra_modifier = "BURN_TRAIL" } );
        EntityAddComponent( entity, "ParticleEmitterComponent", 
            { 
                emitted_material_name="fire",
                count_min="6",
                count_max="8",
                x_pos_offset_min="-4",
                y_pos_offset_min="-4",
                x_pos_offset_max="4",
                y_pos_offset_max="4",
                x_vel_min="-10",
                x_vel_max="10",
                y_vel_min="-10",
                y_vel_max="10",
                lifetime_min="1.1",
                lifetime_max="2.8",
                create_real_particles="1",
                emit_cosmetic_particles="0",
                emission_interval_min_frames="1",
                emission_interval_max_frames="1",
                delay_frames="2",
                is_emitting="1",
            }) 
        EntityAddComponent( entity, "ParticleEmitterComponent", 
            { 
                emitted_material_name="fire",
                custom_style="FIRE",
                count_min="1",
                count_max="1",
                x_pos_offset_min="0",
                y_pos_offset_min="0",
                x_pos_offset_max="0",
                y_pos_offset_max="0",
                is_trail="1",
                trail_gap="1.0",
                x_vel_min="-5",
                x_vel_max="5",
                y_vel_min="-10",
                y_vel_max="10",
                lifetime_min="1.1",
                lifetime_max="2.8",
                create_real_particles="1",
                emit_cosmetic_particles="0",
                emission_interval_min_frames="1",
                emission_interval_max_frames="1",
                delay_frames="2",
                is_emitting="1",
            }) 
    end
end
