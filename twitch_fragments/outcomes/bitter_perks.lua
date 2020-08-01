--Bitter perks
--Is it really worth it ??? wait for it...
--traps
--150
--todo
function twitch_bitter_perks()
	local countString = GlobalsGetValue("twitch_bitterperks", "0")
	local countNumber = tonumber(countString) + 1
	local newN =  tostring(countNumber)
	GlobalsSetValue("twitch_bitterperks", newN)
end