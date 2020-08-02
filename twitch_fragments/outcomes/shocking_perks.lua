--Shocking perks
--What a SHOCKER...
--traps
--150
--todo
function twitch_bitter_perks()
	local countString = GlobalsGetValue("twitch_electricperks", "0")
	local countNumber = tonumber(countString) + 1
	local newN =  tostring(countNumber)
	GlobalsSetValue("twitch_electricperks", newN)
end