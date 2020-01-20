--Take Damage
--The chat wants your death
--bad
--10
--todo
function twitch_cut_health()
    local percent_to_remove = 0.25;
    for _,player_entity in pairs( get_players() ) do
        local x, y = EntityGetTransform( player_entity );
        local hp = 0;
        local damage_models = EntityGetComponent( player_entity, "DamageModelComponent" ) or {};
        for _,damage_model in pairs( damage_models ) do
            hp = hp + ComponentGetValue( damage_model, "hp" );
        end
        local take_damage = EntityLoad( "data/entities/misc/area_damage.xml", x, y );
        local area_damage = EntityGetFirstComponent( take_damage, "AreaDamageComponent" );
        ComponentSetValue( area_damage, "entities_with_tag", "player_unit" );
        ComponentSetValue( area_damage, "damage_per_frame", hp * percent_to_remove );
        ComponentSetValue( area_damage, "damage_type", "DAMAGE_CURSE" );
        EntityAddComponent( take_damage, "LifetimeComponent", { lifetime=2 } );
    end
end
