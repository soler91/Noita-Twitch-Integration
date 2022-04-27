--Holiday Chests
--Next 3 chests r kuul hoo hoo
--traps
--200
--todo
function twitch_holiday_chests()
	local kuu = tonumber(GlobalsGetValue("twitch_holiday_kuu", "0"))
	GlobalsSetValue("twitch_holiday_kuu", tostring(kuu+3))
end