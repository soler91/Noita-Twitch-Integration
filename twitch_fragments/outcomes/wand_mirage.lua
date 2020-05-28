--Wand Mirage
--Is that real wand?
--curses
--60
--todo
function twitch_wand_mirage()
	local countString = GlobalsGetValue("twitch_mirage_wand", "0")
	local countNumber = tonumber(countString) + 2
	local newN =  tostring(countNumber)
	GlobalsSetValue("twitch_mirage_wand", newN)
	GamePrint("Mirrage Start")
end