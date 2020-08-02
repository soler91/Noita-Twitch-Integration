--Cluttered shop
--God clean this mess.
--traps
--100
--unknown
function twitch_cluttered_shop()
	local countString = GlobalsGetValue("twitch_cluttershops", "0")
	local countNumber = tonumber(countString) + 1
	local newN =  tostring(countNumber)
	GlobalsSetValue("twitch_cluttershops", newN)
end