--Block Exit
--Don't jump head first
--traps
--25
--todo
function twitch_block_exit()
	local countString = GlobalsGetValue("twitch_collapse_gate", "0")
	local countNumber = tonumber(countString) + 4
	local newN =  tostring(countNumber)
	GlobalsSetValue("twitch_collapse_gate", newN)
end