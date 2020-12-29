--NG+ Enemies
--NG+ experience brought by chat
--detrimental
--10
--reee
function twitch_scale_enemies()
    enemy_scale = enemy_scale or 2
    SessionNumbersSetValue( "DESIGN_SCALE_ENEMIES", "1" )

	local hp_scale_min = 7 + ( (enemy_scale-1) * 2.5 )
	local hp_scale_max = 25 + ( (enemy_scale-1) * 10 )
	local hp_attack_speed = math.pow( 0.5, enemy_scale )
	
	SessionNumbersSetValue( "DESIGN_NEW_GAME_PLUS_HP_SCALE_MIN", hp_scale_min )
	SessionNumbersSetValue( "DESIGN_NEW_GAME_PLUS_HP_SCALE_MAX", hp_scale_max )
    SessionNumbersSetValue( "DESIGN_NEW_GAME_PLUS_ATTACK_SPEED", hp_attack_speed )
    enemy_scale = enemy_scale + 1
end
