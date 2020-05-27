--Ukko in a box
--What are the odds of that?
--traps
--10
--todo
function twitch_ukko_in_a_box()
	local countString = GlobalsGetValue("twitch_ukko_in_box", "0")
	local countNumber = tonumber(countString) + 1
	local newN =  tostring(countNumber)
	GlobalsSetValue("twitch_ukko_in_box", newN)
end