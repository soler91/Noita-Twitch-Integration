local twitch_effects =
{
    {
        id="TWITCH_DRYSPELL",
        ui_name="Dryspell",
        ui_description="Dries liquids around you!",
        ui_icon="mods/twitch-integration/files/effects/status_icons/dryspell2.png",
        effect_entity="mods/twitch-integration/files/effects/dryspell.xml"
    },
    {
        id="TWITCH_CHONKY",
        ui_name="CHONKY",
        ui_description="Jumping destroys terrain",
        ui_icon="mods/twitch-integration/files/effects/status_icons/chonky.png",
        effect_entity="mods/twitch-integration/files/effects/chonky.xml"
    },
    {
        id="TWITCH_PURGE",
        ui_name="The Purge",
        ui_description="All enemies attack eachother!",
        ui_icon="mods/twitch-integration/files/effects/status_icons/the_purge.png",
        effect_entity="mods/twitch-integration/files/effects/the_purge.xml"
    },
    {
        id="TWITCH_SPEED",
        ui_name="Become Speed",
        ui_description="Gotta go fas!",
        ui_icon="mods/twitch-integration/files/effects/status_icons/become_speed.png",
        effect_entity="mods/twitch-integration/files/effects/become_speed.xml"
    },
    {
        id="TWITCH_COUNTER",
        ui_name="Counter",
        ui_description="Reflect MELEE damage!",
        ui_icon="mods/twitch-integration/files/effects/status_icons/counter.png",
        effect_entity="mods/twitch-integration/files/effects/counter.xml"
    },
    {
        id="TWITCH_FARTS",
        ui_name="Farts",
        ui_description="Release flammable gas from your bottom!",
        ui_icon="mods/twitch-integration/files/effects/status_icons/farts.png",
        effect_entity="mods/twitch-integration/files/effects/farts.xml"
    },
    {
        id="TWITCH_MANA_OVERDRIVE",
        ui_name="Mana Overdrive",
        ui_description="Lots of mana!",
        ui_icon="mods/twitch-integration/files/effects/status_icons/mana_overdrive.png",
        effect_entity="mods/twitch-integration/files/effects/mana_overdrive.xml"
    },
    {
        id="TWITCH_STRONK",
        ui_name="Stronk",
        ui_description="Extra damage!",
        ui_icon="mods/twitch-integration/files/effects/status_icons/stronk.png",
        effect_entity="mods/twitch-integration/files/effects/stronk.xml"
    },
    {
        id="TWITCH_BIG_CONFUSE",
        ui_name="Big Confuse",
        ui_description="Left is Right?",
        ui_icon="mods/twitch-integration/files/effects/status_icons/big_confuse.png",
        effect_entity="mods/twitch-integration/files/effects/big_confuse.xml"
    }
}

for _, effect in pairs(twitch_effects) do
    table.insert(status_effects, effect)
end