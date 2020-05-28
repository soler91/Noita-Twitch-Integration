--Random Spell
--A small favour
--helpful
--190
--todo
function twitch_gift_spell()
    local x, y = get_player_pos()
    SetRandomSeed(GameGetFrameNum(), x + y);

    local chosen_action =
        GetRandomAction(x, y, Random(0, 6), Random(1, 9999999));
    local action = CreateItemActionEntity(chosen_action, x, y);
    EntitySetComponentsWithTagEnabled(action, "enabled_in_world", true);
    EntitySetComponentsWithTagEnabled(action, "item_unidentified", false);
end
