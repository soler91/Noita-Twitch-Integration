--Random Spell
--A small favour
--good
--15
--todo
function twitch_gift_spell()
    for _,player_entity in pairs( get_players() ) do
        local x, y = EntityGetTransform( player_entity );
        SetRandomSeed( GameGetFrameNum(), x + y );

        local chosen_action = GetRandomAction( x, y, Random( 0, 6 ), Random( 1, 9999999 ) );
        local action = CreateItemActionEntity( chosen_action, x, y );
        EntitySetComponentsWithTagEnabled( action,  "enabled_in_world", true );
        EntitySetComponentsWithTagEnabled( action,  "item_unidentified", false );
    end
end
