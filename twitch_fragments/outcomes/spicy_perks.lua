--Spicy perks
--Hot perks in the temple ;^)
--traps
--150
--todo
function twitch_spicy_perks()
	local countString = GlobalsGetValue("twitch_hotperks", "0")
	local countNumber = tonumber(countString) + 1
	local newN =  tostring(countNumber)
	GlobalsSetValue("twitch_hotperks", newN)
end